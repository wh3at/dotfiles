---
title: "Build an admin action UI extension"
source_url: "https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-action"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



This guide is the first part of a five-part tutorial series that describes how to build UI extensions that display as actions and blocks in Shopify admin. It demonstrates how to build a UI extension for an action that enables users to log trackable, resolvable issues on products.

![The issue tracker action over a modal. The action has input fields for a title and description.](https://cdn.shopify.com/shopifycloud/shopify-dev/production/assets/assets/admin/admin-actions-and-block/build-an-admin-action/opened-action-BgrhvQ6k.png)

## [Anchor to What you'll learn](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-action#what-youll-learn)What you'll learn

In this tutorial, you'll learn how to do the following tasks:

* Create a UI extension for an action that displays on the product details page in Shopify admin.
* Configure metafield definitions using TOML declarative custom data definitions.
* Fetch information to populate the UI extension's initial state.
* Create an interface for the UI extension, allowing it to gather input from merchants.
* Update the data using GraphQL based on merchant input.
* Run the UI extension locally and test it on a dev store.

## Requirements

[Create a Partner account](https://www.shopify.com/partners)

[Create a dev store](https://shopify.dev/docs/apps/tools/development-stores#create-a-development-store-to-test-your-app)

[Scaffold an app](https://shopify.dev/docs/apps/build/scaffold-app)

Scaffold an app with the `write_products` access scope that uses [Shopify CLI 3.78 or higher](https://shopify.dev/docs/api/shopify-cli#upgrade).

* If you created a React Router app, then the `write_products` access scope is automatically granted to your app.
* If you created an extension-only app, then you need to explicitly grant the `write_products` access scope to your [custom app](https://shopify.dev/docs/apps/auth/access-token-types/admin-app-access-tokens#changing-api-scopes).
* Add a product to your dev store. The product shouldn't have any custom variants at the start of this tutorial.

## Project

[View on GitHub](https://github.com/Shopify/example-admin-action-and-block-preact)

## [Anchor to Create a new UI extension](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-action#create-a-new-ui-extension)Create a new UI extension

Use Shopify CLI to [generate starter code](https://shopify.dev/docs/api/shopify-cli/app/app-generate-extension) for your UI extension.

Navigate to your app directory:

9

1

cd <directory>

Run the following command to create a new admin action UI extension:

9

1

shopify app generate extension --template admin\_action --name issue-tracker-action

The command creates a new UI extension template in your app's `extensions` directory with the following structure:

99

1

2

3

4

5

6

7

8

9

10

11

extensions/issue-tracker-action

├── README.md

├── locales

│ ├── en.default.json // The default locale for the extension

│ └── fr.json // The French language translations for the extension

├── package.json

├── shopify.extension.toml // The config file for the extension

├── tsconfig.json

├── shopify.d.ts // Provides types for components and APIs available to the extension

└── src

└── AdminAction.jsx // The code that defines the action's UI and behavior

## [Anchor to Configure the metafield definition](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-action#configure-the-metafield-definition)Configure the metafield definition

Add a [declarative custom data definition](https://shopify.dev/docs/apps/build/custom-data/declarative-custom-data-definitions) to define the metafield that will store issue tracker data. This allows your extension to persistently store issue tracking data for products.

99

1

2

3

4

5

6

7

8

9

10

11

12

13

14

15

16

17

18

19

20

21

22

23

24

25

26

27

28

29

30

31

32

33

34

35

36

37

38

39

# Learn more about configuring your app at https://shopify.dev/docs/apps/tools/cli/configuration

client\_id = "1a07dcc482fc60f45a4cc669a88438ea"

name = "2025-04-09-app-ui-project"

handle = "2025-04-09-app-ui-project"

application\_url = "https://example.com/"

embedded = true

[build]

include\_config\_on\_deploy = true

automatically\_update\_urls\_on\_dev = true

[webhooks]

api\_version = "2025-04"

[[webhooks.subscriptions]]

topics = [ "app/uninstalled" ]

uri = "/webhooks/app/uninstalled"

[[webhooks.subscriptions]]

topics = [ "app/scopes\_update" ]

uri = "/webhooks/app/scopes\_update"

[access\_scopes]

# Learn more at https://shopify.dev/docs/apps/tools/cli/configuration#access\_scopes

scopes = "write\_products,read\_orders"

[auth]

redirect\_urls = [ "https://example.com/api/auth" ]

[pos]

embedded = false

[product.metafields.app.issues]

type = "json"

name = "Issue Tracker"

description = "Tracks issues logged for this product"

access.admin = "merchant\_read\_write"

## [Anchor to Create an interface for the UI extension](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-action#create-an-interface-for-the-ui-extension)Create an interface for the UI extension

To create an interface for the UI extension, complete the following steps:

### [Anchor to Review the configuration](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-action#review-the-configuration)Review the configuration

The UI extension's static configuration is stored in its `.toml` file. To display the issue tracker on product detail pages, validate that the `target` is set to `admin.product-details.action.render`.

[admin.product-details.action.render](https://shopify.dev/docs/api/admin-extensions/latest/extension-targets?accordionItem=admin-action-locations-product-details#admin-action-locations-product-details)

[admin.product-details.action.render](https://shopify.dev/docs/api/admin-extensions/latest/extension-targets?accordionItem=admin-action-locations-product-details#admin-action-locations-product-details)

99

1

2

3

4

5

6

7

8

9

10

11

12

13

14

15

api\_version = "2025-10"

[[extensions]]

# Change the merchant-facing name of the extension in locales/en.default.json

name = "t:name"

handle = "issue-tracker-action"

uid = "799a1dec-3979-a563-117b-d4e5cd6b9808fbc17d0d"

type = "ui\_extension"

# Only 1 target can be specified for each Admin action extension

[[extensions.targeting]]

module = "./src/ActionExtension.jsx"

target = "admin.product-details.action.render"

### [Anchor to Update title](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-action#update-title)Update title

To update the name that displays when merchants select the action from the menu, edit the `name` value in the locale files. To localize strings, an admin action UI extension uses the [i18n API](https://shopify.dev/docs/api/admin-extensions/api/action-extension-api#actionextensionapi-propertydetail-i18n). This API gives you access to strings stored in locale files, and automatically chooses the correct string for the current user's locale.

### [Anchor to Translate title](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-action#translate-title)Translate title

Optionally translate your title to French.

### [Anchor to Note the export](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-action#note-the-export)Note the export

You can view the source of your extension in the `src/ActionExtension.jsx` file. This file defines an `extension` function that calls the `render` method from Preact. You can create the extension's body by using the Polaris web components that are automatically provided.

Admin UI extensions are rendered using [Remote DOM](https://github.com/Shopify/remote-dom/tree/remote-dom), which is a fast and secure remote-rendering framework. Because Shopify renders the UI remotely, components used in the extensions must comply with a contract in the Shopify host. We provide these components automatically to the extension.

99

1

2

3

4

5

6

7

8

9

10

11

12

13

14

15

16

17

18

19

20

21

22

23

24

25

26

27

28

29

30

31

32

33

34

35

36

37

38

39

40

41

42

43

44

45

46

47

48

49

50

51

52

53

54

55

56

57

58

59

60

61

62

63

64

65

66

67

68

69

70

71

72

73

74

75

76

77

78

79

80

81

82

83

84

85

86

87

88

89

90

91

92

93

94

95

import { render } from "preact";

import { useCallback, useEffect, useState } from "preact/hooks";

import { getIssues, updateIssues } from "./utils";

export default async () => {

{

render(<Extension />, document.body);

}

function generateId(allIssues) {

return !allIssues?.length ? 0 : allIssues[allIssues.length - 1].id + 1;

}

function validateForm({ title, description }) {

return {

isValid: Boolean(title) && Boolean(description),

errors: {

title: !title,

description: !description,

},

};

}

function Extension() {

const { close, data, i18n } = shopify;

const [issue, setIssue] = useState({ title: "", description: "" });

const [allIssues, setAllIssues] = useState([]);

const [formErrors, setFormErrors] = useState(null);

const { title, description } = issue;

useEffect(() => {

getIssues(data.selected[0].id).then((issues) =>

setAllIssues(issues || []),

);

// eslint-disable-next-line react-hooks/exhaustive-deps

}, []);

const onSubmit = useCallback(async () => {

const { isValid, errors } = validateForm(issue);

setFormErrors(errors);

if (isValid) {

// Commit changes to the database

await updateIssues(data.selected[0].id, [

...allIssues,

{

id: generateId(allIssues),

completed: false,

...issue,

},

]);

// Close the modal using the 'close' API

close();

}

}, [issue, data.selected, allIssues, close]);

return (

<s-admin-action heading={i18n.translate("name")}>

<s-button slot="primaryAction" onClick={onSubmit}>

{i18n.translate("issue-create-button")}

</s-button>

<s-button slot="secondaryActions" onClick={close}>

{i18n.translate("issue-cancel-button")}

</s-button>

<s-text-field

value={title}

error={

formErrors?.title ? i18n.translate("issue-title-error") : undefined

}

onChange={(event) =>

setIssue((prev) => ({ ...prev, title: event.target.value }))

}

label={i18n.translate("issue-title-label")}

maxLength={50}

/>

<s-box padding-block-start="large">

<s-text-area

value={description}

error={

formErrors?.description

? i18n.translate("issue-description-error")

: undefined

}

onChange={(event) =>

setIssue((prev) => ({ ...prev, description: event.target.value }))

}

label={i18n.translate("issue-description-label")}

max-length={300}

/>

</s-box>

</s-admin-action>

);

}

};

### [Anchor to Render a UI](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-action#render-a-ui)Render a UI

To build your action's UX, return some components from `src/ActionExtension.jsx`.

99

1

2

3

4

5

6

7

8

9

10

11

12

13

14

15

16

17

18

19

20

21

22

23

24

25

26

27

28

29

30

31

32

33

34

35

36

37

38

39

40

41

42

43

44

45

46

47

48

49

50

51

52

53

54

55

56

57

58

59

60

61

62

63

64

65

66

67

68

69

70

71

72

73

74

75

76

77

78

79

80

81

82

83

84

85

86

87

88

89

90

91

92

93

94

95

import { render } from "preact";

import { useCallback, useEffect, useState } from "preact/hooks";

import { getIssues, updateIssues } from "./utils";

export default async () => {

{

render(<Extension />, document.body);

}

function generateId(allIssues) {

return !allIssues?.length ? 0 : allIssues[allIssues.length - 1].id + 1;

}

function validateForm({ title, description }) {

return {

isValid: Boolean(title) && Boolean(description),

errors: {

title: !title,

description: !description,

},

};

}

function Extension() {

const { close, data, i18n } = shopify;

const [issue, setIssue] = useState({ title: "", description: "" });

const [allIssues, setAllIssues] = useState([]);

const [formErrors, setFormErrors] = useState(null);

const { title, description } = issue;

useEffect(() => {

getIssues(data.selected[0].id).then((issues) =>

setAllIssues(issues || []),

);

// eslint-disable-next-line react-hooks/exhaustive-deps

}, []);

const onSubmit = useCallback(async () => {

const { isValid, errors } = validateForm(issue);

setFormErrors(errors);

if (isValid) {

// Commit changes to the database

await updateIssues(data.selected[0].id, [

...allIssues,

{

id: generateId(allIssues),

completed: false,

...issue,

},

]);

// Close the modal using the 'close' API

close();

}

}, [issue, data.selected, allIssues, close]);

return (

<s-admin-action heading={i18n.translate("name")}>

<s-button slot="primaryAction" onClick={onSubmit}>

{i18n.translate("issue-create-button")}

</s-button>

<s-button slot="secondaryActions" onClick={close}>

{i18n.translate("issue-cancel-button")}

</s-button>

<s-text-field

value={title}

error={

formErrors?.title ? i18n.translate("issue-title-error") : undefined

}

onChange={(event) =>

setIssue((prev) => ({ ...prev, title: event.target.value }))

}

label={i18n.translate("issue-title-label")}

maxLength={50}

/>

<s-box padding-block-start="large">

<s-text-area

value={description}

error={

formErrors?.description

? i18n.translate("issue-description-error")

: undefined

}

onChange={(event) =>

setIssue((prev) => ({ ...prev, description: event.target.value }))

}

label={i18n.translate("issue-description-label")}

max-length={300}

/>

</s-box>

</s-admin-action>

);

}

};

## [Anchor to Write the UI extension's logic and connect to the GraphQL Admin API](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-action#write-the-ui-extensions-logic-and-connect-to-the-graphql-admin-api)Write the UI extension's logic and connect to the GraphQL Admin API

After you've configured the metafield definition and defined the extension's UI, use standard Preact tooling to write the logic that controls it.

When you're writing UI extensions, you don't need proxy calls to the [GraphQL Admin API](https://shopify.dev/docs/api/admin-graphql) through your app's backend. Instead, your UI extension can use [direct API access](https://shopify.dev/docs/api/admin-extensions#directapiaccess) to create requests directly using `fetch`. For merchants, this makes UI extensions more performant and responsive.

In this step, you'll create a utility file to contain GraphQL queries that the UI extension uses to read and write data to the metafield API.

Your app can also get data from the extension APIs, which includes data on the current resource from the `data` API.

Add new file at `./src/utils.js`. This file contains the GraphQL queries that the extension uses to read and write metafield data (the metafield definition is handled by TOML).

[![](https://shopify.dev/images/logos/GraphQL.svg)![](https://shopify.dev/images/logos/GraphQL-dark.svg)

metafieldsSet](/docs/api/admin-graphql/latest/mutations/metafieldsSet)

[![](https://shopify.dev/images/logos/GraphQL.svg)![](https://shopify.dev/images/logos/GraphQL-dark.svg)

metafieldsSet](/docs/api/admin-graphql/latest/mutations/metafieldsSet)

Import the `getIssues` utility method and use it to update the extension state.

99

1

2

3

4

5

6

7

8

9

10

11

12

13

14

15

16

17

18

19

20

21

22

23

24

25

26

27

28

29

30

31

32

33

34

35

36

37

38

39

40

41

42

43

44

45

46

47

48

49

50

51

52

53

54

55

56

57

58

59

60

61

62

63

64

65

66

67

68

69

70

71

72

73

74

75

76

77

78

79

80

81

82

83

84

85

86

87

88

89

90

91

92

93

94

95

import { render } from "preact";

import { useCallback, useEffect, useState } from "preact/hooks";

import { getIssues, updateIssues } from "./utils";

export default async () => {

{

render(<Extension />, document.body);

}

function generateId(allIssues) {

return !allIssues?.length ? 0 : allIssues[allIssues.length - 1].id + 1;

}

function validateForm({ title, description }) {

return {

isValid: Boolean(title) && Boolean(description),

errors: {

title: !title,

description: !description,

},

};

}

function Extension() {

const { close, data, i18n } = shopify;

const [issue, setIssue] = useState({ title: "", description: "" });

const [allIssues, setAllIssues] = useState([]);

const [formErrors, setFormErrors] = useState(null);

const { title, description } = issue;

useEffect(() => {

getIssues(data.selected[0].id).then((issues) =>

setAllIssues(issues || []),

);

// eslint-disable-next-line react-hooks/exhaustive-deps

}, []);

const onSubmit = useCallback(async () => {

const { isValid, errors } = validateForm(issue);

setFormErrors(errors);

if (isValid) {

// Commit changes to the database

await updateIssues(data.selected[0].id, [

...allIssues,

{

id: generateId(allIssues),

completed: false,

...issue,

},

]);

// Close the modal using the 'close' API

close();

}

}, [issue, data.selected, allIssues, close]);

return (

<s-admin-action heading={i18n.translate("name")}>

<s-button slot="primaryAction" onClick={onSubmit}>

{i18n.translate("issue-create-button")}

</s-button>

<s-button slot="secondaryActions" onClick={close}>

{i18n.translate("issue-cancel-button")}

</s-button>

<s-text-field

value={title}

error={

formErrors?.title ? i18n.translate("issue-title-error") : undefined

}

onChange={(event) =>

setIssue((prev) => ({ ...prev, title: event.target.value }))

}

label={i18n.translate("issue-title-label")}

maxLength={50}

/>

<s-box padding-block-start="large">

<s-text-area

value={description}

error={

formErrors?.description

? i18n.translate("issue-description-error")

: undefined

}

onChange={(event) =>

setIssue((prev) => ({ ...prev, description: event.target.value }))

}

label={i18n.translate("issue-description-label")}

max-length={300}

/>

</s-box>

</s-admin-action>

);

}

};

Call the `updateIssues` utility method when the form is submitted.

99

1

2

3

4

5

6

7

8

9

10

11

12

13

14

15

16

17

18

19

20

21

22

23

24

25

26

27

28

29

30

31

32

33

34

35

36

37

38

39

40

41

42

43

44

45

46

47

48

49

50

51

52

53

54

55

56

57

58

59

60

61

62

63

64

65

66

67

68

69

70

71

72

73

74

75

76

77

78

79

80

81

82

83

84

85

86

87

88

89

90

91

92

93

94

95

import { render } from "preact";

import { useCallback, useEffect, useState } from "preact/hooks";

import { getIssues, updateIssues } from "./utils";

export default async () => {

{

render(<Extension />, document.body);

}

function generateId(allIssues) {

return !allIssues?.length ? 0 : allIssues[allIssues.length - 1].id + 1;

}

function validateForm({ title, description }) {

return {

isValid: Boolean(title) && Boolean(description),

errors: {

title: !title,

description: !description,

},

};

}

function Extension() {

const { close, data, i18n } = shopify;

const [issue, setIssue] = useState({ title: "", description: "" });

const [allIssues, setAllIssues] = useState([]);

const [formErrors, setFormErrors] = useState(null);

const { title, description } = issue;

useEffect(() => {

getIssues(data.selected[0].id).then((issues) =>

setAllIssues(issues || []),

);

// eslint-disable-next-line react-hooks/exhaustive-deps

}, []);

const onSubmit = useCallback(async () => {

const { isValid, errors } = validateForm(issue);

setFormErrors(errors);

if (isValid) {

// Commit changes to the database

await updateIssues(data.selected[0].id, [

...allIssues,

{

id: generateId(allIssues),

completed: false,

...issue,

},

]);

// Close the modal using the 'close' API

close();

}

}, [issue, data.selected, allIssues, close]);

return (

<s-admin-action heading={i18n.translate("name")}>

<s-button slot="primaryAction" onClick={onSubmit}>

{i18n.translate("issue-create-button")}

</s-button>

<s-button slot="secondaryActions" onClick={close}>

{i18n.translate("issue-cancel-button")}

</s-button>

<s-text-field

value={title}

error={

formErrors?.title ? i18n.translate("issue-title-error") : undefined

}

onChange={(event) =>

setIssue((prev) => ({ ...prev, title: event.target.value }))

}

label={i18n.translate("issue-title-label")}

maxLength={50}

/>

<s-box padding-block-start="large">

<s-text-area

value={description}

error={

formErrors?.description

? i18n.translate("issue-description-error")

: undefined

}

onChange={(event) =>

setIssue((prev) => ({ ...prev, description: event.target.value }))

}

label={i18n.translate("issue-description-label")}

max-length={300}

/>

</s-box>

</s-admin-action>

);

}

};

## [Anchor to Test the UI extension](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-action#test-the-ui-extension)Test the UI extension

After you've built the UI extension, test it with the following steps:

1. Navigate to your app directory:

   9

   1

   cd <directory>
2. To build and preview your app, either start or restart your server with the following command:

   9

   1

   shopify app dev
3. Press `p` to open the Dev Console.
4. In the Dev Console, click on the preview link for the issue tracker extension.
5. The product details page opens. If you don't have a product in your store, then you need to create one.
6. To launch your extension, select it from the **More actions** menu found at the top-right of the page.
7. Fill out the modal and click **Create**.
8. Validate that the metafield is created and populated with your issue text, by navigating to the metafields card at the bottom of the page, and select **Show all**.

Update your code to the control the form and write the data to the admin metafield API using the methods from `./src/utils.js`.

99

1

2

3

4

5

6

7

8

9

10

11

12

13

14

15

16

17

18

19

20

21

22

23

24

25

26

27

28

29

30

31

32

33

34

35

36

37

38

39

# Learn more about configuring your app at https://shopify.dev/docs/apps/tools/cli/configuration

client\_id = "1a07dcc482fc60f45a4cc669a88438ea"

name = "2025-04-09-app-ui-project"

handle = "2025-04-09-app-ui-project"

application\_url = "https://example.com/"

embedded = true

[build]

include\_config\_on\_deploy = true

automatically\_update\_urls\_on\_dev = true

[webhooks]

api\_version = "2025-04"

[[webhooks.subscriptions]]

topics = [ "app/uninstalled" ]

uri = "/webhooks/app/uninstalled"

[[webhooks.subscriptions]]

topics = [ "app/scopes\_update" ]

uri = "/webhooks/app/scopes\_update"

[access\_scopes]

# Learn more at https://shopify.dev/docs/apps/tools/cli/configuration#access\_scopes

scopes = "write\_products,read\_orders"

[auth]

redirect\_urls = [ "https://example.com/api/auth" ]

[pos]

embedded = false

[product.metafields.app.issues]

type = "json"

name = "Issue Tracker"

description = "Tracks issues logged for this product"

access.admin = "merchant\_read\_write"

99

1

2

3

4

5

6

7

8

9

10

11

12

13

14

15

api\_version = "2025-10"

[[extensions]]

# Change the merchant-facing name of the extension in locales/en.default.json

name = "t:name"

handle = "issue-tracker-action"

uid = "799a1dec-3979-a563-117b-d4e5cd6b9808fbc17d0d"

type = "ui\_extension"

# Only 1 target can be specified for each Admin action extension

[[extensions.targeting]]

module = "./src/ActionExtension.jsx"

target = "admin.product-details.action.render"

99

1

2

3

4

5

6

7

8

9

10

11

12

13

14

15

16

{

"name": "Create an issue",

"create-issue-heading": "Create an issue",

"edit-issue-heading": "Edit your issue",

"issue-description-label": "Description",

"issue-description-error": "Please enter a description",

"issue-title-label": "Title",

"issue-title-error": "Please enter a title",

"issue-create-button": "Create",

"issue-cancel-button": "Cancel",

"issue-save-button": "Save",

"issue-edit-button": "Edit",

"issue-generate-button": "Generate issue",

"issue-generate-banner-text": "Automatically fill the issue based on past customer feedback"

}

99

1

2

3

4

5

6

7

8

9

10

11

12

13

14

15

16

{

"name": "Créer un problème",

"create-issue-heading": "Créer un problème",

"edit-issue-heading": "Modifier votre problème",

"issue-description-label": "Description",

"issue-description-error": "Veuillez entrer une description",

"issue-title-label": "Titre",

"issue-title-error": "Veuillez entrer un titre",

"issue-create-button": "Create",

"issue-cancel-button": "Annuler",

"issue-save-button": "Enregistrer",

"issue-edit-button": "Modifier",

"issue-generate-button": "Générer un problème",

"issue-generate-banner-text": "Remplir automatiquement le problème en fonction des retours clients passés"

}

99

1

2

3

4

5

6

7

8

9

10

11

12

13

14

15

16

17

18

19

20

21

22

23

24

25

26

27

28

29

30

31

32

33

34

35

36

37

38

39

40

41

42

43

44

45

46

47

48

49

50

51

52

53

54

55

56

57

58

59

60

61

62

63

64

65

66

67

68

69

70

71

72

73

74

75

76

77

78

79

80

81

82

83

84

85

86

87

88

89

90

91

92

93

94

95

import { render } from "preact";

import { useCallback, useEffect, useState } from "preact/hooks";

import { getIssues, updateIssues } from "./utils";

export default async () => {

{

render(<Extension />, document.body);

}

function generateId(allIssues) {

return !allIssues?.length ? 0 : allIssues[allIssues.length - 1].id + 1;

}

function validateForm({ title, description }) {

return {

isValid: Boolean(title) && Boolean(description),

errors: {

title: !title,

description: !description,

},

};

}

function Extension() {

const { close, data, i18n } = shopify;

const [issue, setIssue] = useState({ title: "", description: "" });

const [allIssues, setAllIssues] = useState([]);

const [formErrors, setFormErrors] = useState(null);

const { title, description } = issue;

useEffect(() => {

getIssues(data.selected[0].id).then((issues) =>

setAllIssues(issues || []),

);

// eslint-disable-next-line react-hooks/exhaustive-deps

}, []);

const onSubmit = useCallback(async () => {

const { isValid, errors } = validateForm(issue);

setFormErrors(errors);

if (isValid) {

// Commit changes to the database

await updateIssues(data.selected[0].id, [

...allIssues,

{

id: generateId(allIssues),

completed: false,

...issue,

},

]);

// Close the modal using the 'close' API

close();

}

}, [issue, data.selected, allIssues, close]);

return (

<s-admin-action heading={i18n.translate("name")}>

<s-button slot="primaryAction" onClick={onSubmit}>

{i18n.translate("issue-create-button")}

</s-button>

<s-button slot="secondaryActions" onClick={close}>

{i18n.translate("issue-cancel-button")}

</s-button>

<s-text-field

value={title}

error={

formErrors?.title ? i18n.translate("issue-title-error") : undefined

}

onChange={(event) =>

setIssue((prev) => ({ ...prev, title: event.target.value }))

}

label={i18n.translate("issue-title-label")}

maxLength={50}

/>

<s-box padding-block-start="large">

<s-text-area

value={description}

error={

formErrors?.description

? i18n.translate("issue-description-error")

: undefined

}

onChange={(event) =>

setIssue((prev) => ({ ...prev, description: event.target.value }))

}

label={i18n.translate("issue-description-label")}

max-length={300}

/>

</s-box>

</s-admin-action>

);

}

};

99

1

2

3

4

5

6

7

8

9

10

11

12

13

14

15

16

17

18

19

20

21

22

23

24

25

26

27

28

29

30

31

32

33

34

35

36

37

38

39

40

41

42

43

44

45

46

47

48

49

50

51

52

53

54

55

56

57

58

59

60

61

62

63

64

export async function updateIssues(id, newIssues) {

// This example uses metafields to store the data. For more information, refer to https://shopify.dev/docs/apps/custom-data/metafields.

return await makeGraphQLQuery(

`mutation SetMetafield($ownerId: ID!, $namespace: String!, $key: String!, $type: String!, $value: String!) {

metafieldsSet(metafields: [{ownerId: $ownerId, namespace: $namespace, key: $key, type: $type, value: $value}]) {

metafields {

id

namespace

key

jsonValue

}

userErrors {

field

message

code

}

}

}`,

{

ownerId: id,

namespace: "$app",

key: "issues",

type: "json",

value: JSON.stringify(newIssues),

},

);

}

export async function getIssues(productId) {

// This example uses metafields to store the data. For more information, refer to https://shopify.dev/docs/apps/custom-data/metafields.

const res = await makeGraphQLQuery(

`query Product($id: ID!) {

product(id: $id) {

metafield(namespace: "$app", key: "issues") {

value

}

}

}`,

{ id: productId },

);

if (res?.data?.product?.metafield?.value) {

return JSON.parse(res.data.product.metafield.value);

}

}

async function makeGraphQLQuery(query, variables) {

const graphQLQuery = {

query,

variables,

};

const res = await fetch("shopify:admin/api/graphql.json", {

method: "POST",

body: JSON.stringify(graphQLQuery),

});

if (!res.ok) {

console.error("Network error");

}

return await res.json();

}

### [Anchor to Next steps](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-action#next-steps)Next steps

[![](https://shopify.dev/images/icons/32/blocks.png)![](https://shopify.dev/images/icons/32/blocks-dark.png)

Admin block UI extension

In the next tutorial in this series, you'll build a UI extension that lists the issues created by your action extension. This new extension will display as a block in Shopify admin.

Admin block UI extension

In the next tutorial in this series, you'll build a UI extension that lists the issues created by your action extension. This new extension will display as a block in Shopify admin.](/docs/apps/admin/admin-actions-and-blocks/build-an-admin-block)

[Admin block UI extension](https://shopify.dev/docs/apps/admin/admin-actions-and-blocks/build-an-admin-block)

[![](https://shopify.dev/images/icons/32/blocks.png)![](https://shopify.dev/images/icons/32/blocks-dark.png)

Extension targets

Learn about the various places in Shopify admin where UI extensions can be displayed.

Extension targets

Learn about the various places in Shopify admin where UI extensions can be displayed.](/docs/api/admin-extensions/extension-targets)

[Extension targets](https://shopify.dev/docs/api/admin-extensions/extension-targets)

[![](https://shopify.dev/images/icons/32/blocks.png)![](https://shopify.dev/images/icons/32/blocks-dark.png)

Components

Learn about the full set of available components for writing admin UI extensions.

Components

Learn about the full set of available components for writing admin UI extensions.](/docs/api/admin-extensions/components)

[Components](https://shopify.dev/docs/api/admin-extensions/components)

Was this page helpful?

YesNo
