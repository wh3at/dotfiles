---
title: "Build an admin block UI extension"
source_url: "https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-block"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



This guide is the second part of a five-part tutorial series that describes how to build UI extensions that display as actions and blocks in Shopify admin. Before starting this guide, you'll need to build or copy the admin action UI extension from the [Build a UI extension for an admin action](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-action) tutorial.

So far, you've created a UI extension for an action that enables buyers to create issues for a product. However, merchants need an easy way to see them. This guide demonstrates how to create a UI extension for a block in Shopify admin that displays buyer-created issues for a product.

![The new block UI extension, at the bottom of the page. Two issues, created with the action, display.](https://cdn.shopify.com/shopifycloud/shopify-dev/production/assets/assets/admin/admin-actions-and-block/build-an-admin-block/block-on-page-csb-BneaXTRv.png)

## [Anchor to What you'll learn](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-block#what-youll-learn)What you'll learn

In this tutorial, you'll learn how to do the following tasks:

* Create a UI extension for a block that displays on the product details page.
* Configure metafield definitions using TOML declarative custom data definitions.
* Fetch information to populate the UI extension's initial state.
* Connect the UI extension to Shopify admin's contextual save bar, when gathering input, for seamless page editing.
* Run the UI extension locally and test it on a dev store.

## Requirements

[Create a Partner account](https://www.shopify.com/partners)

[Create a dev store](https://shopify.dev/docs/apps/tools/development-stores#create-a-development-store-to-test-your-app)

[Scaffold an app](https://shopify.dev/docs/apps/build/scaffold-app)

Scaffold an app with the `write_products` access scope that uses [Shopify CLI 3.78 or higher](https://shopify.dev/docs/api/shopify-cli#upgrade).

* If you created a React Router app, then the `write_products` access scope is automatically granted to your app.
* If you created an extension-only app, then you need to explicitly grant the `write_products` access scope to your [custom app](https://shopify.dev/docs/apps/auth/access-token-types/admin-app-access-tokens#changing-api-scopes).
* Add a product to your dev store. The product should not have any custom variants at the start of this tutorial.

[Build an admin action UI extension](https://shopify.dev/docs/apps/admin/admin-actions-and-blocks/build-an-admin-action)

Complete or copy the code from the [Build an admin action UI extension](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-action) tutorial.

## Project

[View on GitHub](https://github.com/Shopify/example-admin-action-and-block-preact)

## [Anchor to Create an admin block UI extension](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-block#create-an-admin-block-ui-extension)Create an admin block UI extension

Use Shopify CLI to [generate starter code](https://shopify.dev/docs/api/shopify-cli/app/app-generate-extension) for your UI extension.

Navigate to your app directory:

9

1

cd <directory>

Run the following command to create a new admin block UI extension:

9

1

shopify app generate extension --template admin\_block --name issue-tracker-block

The command creates a new extension template in your app's `extensions` directory with the following structure:

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

extensions/issue-tracker-block

├── README.md

├── locales

│ ├── en.default.json // The default locale for the extension

│ └── fr.json // The French language translations for the extension

├── package.json

├── shopify.extension.toml // The config file for the extension

├── tsconfig.json

├── shopify.d.ts // Provides types for components and APIs available to the extension

└── src

└── BlockExtension.jsx // The code that defines the block's UI and behavior

## [Anchor to Configure the metafield definition](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-block#configure-the-metafield-definition)Configure the metafield definition

Use [declarative custom data definitions](https://shopify.dev/docs/apps/build/custom-data/declarative-custom-data-definitions) to define the metafield that will store issue tracker data.

> **Note**: If your `shopify.app.toml` file already contains this metafield definition (for example, from completing the [Build an admin action](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-action) tutorial), you can skip this step.

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

## [Anchor to Create an interface for the UI extension](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-block#create-an-interface-for-the-ui-extension)Create an interface for the UI extension

To create an interface for the UI extension, complete the following steps:

### [Anchor to Review the configuration](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-block#review-the-configuration)Review the configuration

The UI extension's static configuration is stored in its `.toml` file. To display the issue tracker on product detail pages, set the target to `admin.product-details.block.render`.

[admin.product-details.block.render](https://shopify.dev/docs/api/admin-extensions/latest/extension-targets?accordionItem=admin-block-locations-product-details#admin-block-locations-product-details)

[admin.product-details.block.render](https://shopify.dev/docs/api/admin-extensions/latest/extension-targets?accordionItem=admin-block-locations-product-details#admin-block-locations-product-details)

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

api\_version = "2025-10"

[[extensions]]

# Change the merchant-facing name of the extension in locales/en.default.json

name = "t:name"

handle = "issue-tracker-block"

uid = "5c534720-d393-1436-d4d2-438d615062be6175f52d"

type = "ui\_extension"

# Only 1 target can be specified for each Admin block extension

[[extensions.targeting]]

module = "./src/BlockExtension.jsx"

target = "admin.product-details.block.render"

### [Anchor to Update title](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-block#update-title)Update title

To update the name that displays when merchants select the action from the menu, edit the `name` value in the locale files. To localize strings, a UI extension for an admin block uses the [i18n API](https://shopify.dev/docs/api/admin-extensions/api/block-extension-api#blockextensionapi-propertydetail-i18n). This API gives you access to strings stored in locale files, and automatically chooses the correct string for the current user's locale.

### [Anchor to Translate title](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-block#translate-title)Translate title

Optionally translate your title to French.

### [Anchor to Note the export](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-block#note-the-export)Note the export

You can view the source of your extension in the `src/BlockExtension.jsx` file. This file defines a functional Preact component that's exported to run at the extension's target. You can create the extension's body by using the Polaris web components that are automatically provided.

Admin UI extensions are rendered using [Remote DOM](https://github.com/Shopify/remote-dom/tree/remote-dom), which is a fast and secure remote-rendering framework. Because Shopify renders the UI remotely, components used in the extensions must comply with a contract in the Shopify host. We provide these components automatically to the extension.

999

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

import { render } from "preact";

import { useEffect, useMemo, useState } from "preact/hooks";

import { updateIssues, getIssues } from "./utils";

export default async () => {

{

render(<Extension />, document.body);

}

const PAGE\_SIZE = 3;

function Extension() {

const { data, i18n } = shopify;

const [loading, setLoading] = useState(true);

const [\_, setInitialValues] = useState([]);

const [issues, setIssues] = useState([]);

const [currentPage, setCurrentPage] = useState(1);

const productId = data.selected[0].id;

const issuesCount = issues.length;

const totalPages = issuesCount / PAGE\_SIZE;

useEffect(() => {

(async function getProductInfo() {

// Load the product's metafield of type issues

const productData = await getIssues(productId);

setLoading(false);

if (productData?.data?.product?.metafield?.value) {

const parsedIssues = JSON.parse(

productData.data.product.metafield.value,

);

setInitialValues(

parsedIssues.map(({ completed }) => Boolean(completed)),

);

### [Anchor to Render a UI](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-block#render-a-ui)Render a UI

To build your block's UX, return some components from `src/BlockExtension.jsx`. You'll create a simple UI to list out your product issues.

999

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

import { render } from "preact";

import { useEffect, useMemo, useState } from "preact/hooks";

import { updateIssues, getIssues } from "./utils";

export default async () => {

{

render(<Extension />, document.body);

}

const PAGE\_SIZE = 3;

function Extension() {

const { data, i18n } = shopify;

const [loading, setLoading] = useState(true);

const [\_, setInitialValues] = useState([]);

const [issues, setIssues] = useState([]);

const [currentPage, setCurrentPage] = useState(1);

const productId = data.selected[0].id;

const issuesCount = issues.length;

const totalPages = issuesCount / PAGE\_SIZE;

useEffect(() => {

(async function getProductInfo() {

// Load the product's metafield of type issues

const productData = await getIssues(productId);

setLoading(false);

if (productData?.data?.product?.metafield?.value) {

const parsedIssues = JSON.parse(

productData.data.product.metafield.value,

);

setInitialValues(

parsedIssues.map(({ completed }) => Boolean(completed)),

);

## [Anchor to Write the UI extension's logic and connect to the GraphQL Admin API](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-block#write-the-ui-extensions-logic-and-connect-to-the-graphql-admin-api)Write the UI extension's logic and connect to the GraphQL Admin API

After defining the extension's UI, use standard Preact tooling to write the logic that controls it.

When you're writing UI extensions, you don't need proxy calls to the [GraphQL Admin API](https://shopify.dev/docs/api/admin-graphql) through your app's backend. Instead, your UI extension can use [direct API access](https://shopify.dev/docs/api/admin-extensions#directapiaccess) to create requests directly using `fetch`. For merchants, this makes UI extensions more performant and responsive. This guide includes a utility file for GraphQL queries.

Your app can also get data from the extension APIs, which includes data on the current resource from the `data` API.

First, you'll need to populate the UI extension's interface with existing issue data. To do this, use direct API calls to query the Issue Tracker metafield configured in the previous step, and use the metafield data to populate a paginated list in the UI extension's block. Paginate issues to prevent the block from becoming too tall and difficult for users to use.

Create a new file at `./src/utils.js` and add the GraphQL queries that the extension uses to read and write metafield data (the metafield definition is handled by TOML).

[![](https://shopify.dev/images/logos/GraphQL.svg)![](https://shopify.dev/images/logos/GraphQL-dark.svg)

metafieldsSet](/docs/api/admin-graphql/latest/mutations/metafieldsSet)

[![](https://shopify.dev/images/logos/GraphQL.svg)![](https://shopify.dev/images/logos/GraphQL-dark.svg)

metafieldsSet](/docs/api/admin-graphql/latest/mutations/metafieldsSet)

Import the `getIssues` utility method from the `utils.js` file. You'll use it to query the GraphQL Admin API for the initial data for the extension.

999

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

import { render } from "preact";

import { useEffect, useMemo, useState } from "preact/hooks";

import { updateIssues, getIssues } from "./utils";

export default async () => {

{

render(<Extension />, document.body);

}

const PAGE\_SIZE = 3;

function Extension() {

const { data, i18n } = shopify;

const [loading, setLoading] = useState(true);

const [\_, setInitialValues] = useState([]);

const [issues, setIssues] = useState([]);

const [currentPage, setCurrentPage] = useState(1);

const productId = data.selected[0].id;

const issuesCount = issues.length;

const totalPages = issuesCount / PAGE\_SIZE;

useEffect(() => {

(async function getProductInfo() {

// Load the product's metafield of type issues

const productData = await getIssues(productId);

setLoading(false);

if (productData?.data?.product?.metafield?.value) {

const parsedIssues = JSON.parse(

productData.data.product.metafield.value,

);

setInitialValues(

parsedIssues.map(({ completed }) => Boolean(completed)),

);

### [Anchor to Get initial data and set up pagination](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-block#get-initial-data-and-set-up-pagination)Get initial data and set up pagination

Use the `getIssues` utility method to fetch the initial data for the UI extension. Add a function to manage pagination.

999

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

import { render } from "preact";

import { useEffect, useMemo, useState } from "preact/hooks";

import { updateIssues, getIssues } from "./utils";

export default async () => {

{

render(<Extension />, document.body);

}

const PAGE\_SIZE = 3;

function Extension() {

const { data, i18n } = shopify;

const [loading, setLoading] = useState(true);

const [\_, setInitialValues] = useState([]);

const [issues, setIssues] = useState([]);

const [currentPage, setCurrentPage] = useState(1);

const productId = data.selected[0].id;

const issuesCount = issues.length;

const totalPages = issuesCount / PAGE\_SIZE;

useEffect(() => {

(async function getProductInfo() {

// Load the product's metafield of type issues

const productData = await getIssues(productId);

setLoading(false);

if (productData?.data?.product?.metafield?.value) {

const parsedIssues = JSON.parse(

productData.data.product.metafield.value,

);

setInitialValues(

parsedIssues.map(({ completed }) => Boolean(completed)),

);

## [Anchor to Update data and integrate with the page's contextual save bar](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-block#update-data-and-integrate-with-the-pages-contextual-save-bar)Update data and integrate with the page's contextual save bar

Next, you'll create a status dropdown and a delete button that enables users to either mark issues as completed or remove them entirely. When you create the status dropdown, you'll integrate it with the page's contextual save bar. This enables users to save changes to your block using the same controls that they would use to save changes to other fields in the Shopify admin.

Import the `updateIssues` utility method and use it to update the UI extension state.

999

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

import { render } from "preact";

import { useEffect, useMemo, useState } from "preact/hooks";

import { updateIssues, getIssues } from "./utils";

export default async () => {

{

render(<Extension />, document.body);

}

const PAGE\_SIZE = 3;

function Extension() {

const { data, i18n } = shopify;

const [loading, setLoading] = useState(true);

const [\_, setInitialValues] = useState([]);

const [issues, setIssues] = useState([]);

const [currentPage, setCurrentPage] = useState(1);

const productId = data.selected[0].id;

const issuesCount = issues.length;

const totalPages = issuesCount / PAGE\_SIZE;

useEffect(() => {

(async function getProductInfo() {

// Load the product's metafield of type issues

const productData = await getIssues(productId);

setLoading(false);

if (productData?.data?.product?.metafield?.value) {

const parsedIssues = JSON.parse(

productData.data.product.metafield.value,

);

setInitialValues(

parsedIssues.map(({ completed }) => Boolean(completed)),

);

### [Anchor to Handle status changes and deleting issues](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-block#handle-status-changes-and-deleting-issues)Handle status changes and deleting issues

Add the functions to handle deleting and changing the status.
Call the `updateIssues` utility method when the issue is deleted and when the form is submitted.

999

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

import { render } from "preact";

import { useEffect, useMemo, useState } from "preact/hooks";

import { updateIssues, getIssues } from "./utils";

export default async () => {

{

render(<Extension />, document.body);

}

const PAGE\_SIZE = 3;

function Extension() {

const { data, i18n } = shopify;

const [loading, setLoading] = useState(true);

const [\_, setInitialValues] = useState([]);

const [issues, setIssues] = useState([]);

const [currentPage, setCurrentPage] = useState(1);

const productId = data.selected[0].id;

const issuesCount = issues.length;

const totalPages = issuesCount / PAGE\_SIZE;

useEffect(() => {

(async function getProductInfo() {

// Load the product's metafield of type issues

const productData = await getIssues(productId);

setLoading(false);

if (productData?.data?.product?.metafield?.value) {

const parsedIssues = JSON.parse(

productData.data.product.metafield.value,

);

setInitialValues(

parsedIssues.map(({ completed }) => Boolean(completed)),

);

## [Anchor to Test the UI extension](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-block#test-the-ui-extension)Test the UI extension

After you've built the UI extension, test it with the following steps:

1. Navigate to your app directory:

   9

   1

   cd <directory>
2. To build and preview your app, either start or restart your server with the following command:

   9

   1

   shopify app dev
3. Press `p` to open the Dev Console
4. In the Dev Console page, click on the preview link for the issue tracker UI extension. The product details page opens. If you don't have a product in your store, then you need to create one.
5. To find your block, scroll to the bottom of the page. It should display the issues that you've created so far.

![The Dev Console, showing both UI extensions.](https://cdn.shopify.com/shopifycloud/shopify-dev/production/assets/assets/admin/admin-actions-and-block/build-an-admin-block/dev-console-B_T2NZsq.png)

6. When you change the status of an issue, the contextual save bar should display. The change is saved when you click the Save button.

![The new block UI extension, at the bottom of the page. Issues that have been created with the action display.](https://cdn.shopify.com/shopifycloud/shopify-dev/production/assets/assets/admin/admin-actions-and-block/build-an-admin-block/block-on-page-csb-BneaXTRv.png)

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

api\_version = "2025-10"

[[extensions]]

# Change the merchant-facing name of the extension in locales/en.default.json

name = "t:name"

handle = "issue-tracker-block"

uid = "5c534720-d393-1436-d4d2-438d615062be6175f52d"

type = "ui\_extension"

# Only 1 target can be specified for each Admin block extension

[[extensions.targeting]]

module = "./src/BlockExtension.jsx"

target = "admin.product-details.block.render"

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

{

"name": "Product Issues",

"issue-column-heading": "Issue",

"status-column-heading": "Status",

"select-label": "Status",

"option-todo": "Todo",

"option-completed": "Completed",

"delete-issue-button": "Delete issue",

"edit-issue-button": "Edit issue",

"add-issue-button": "Add issue",

"collapsed-summary": "Not enough product variants",

"no-issues-text": "No issues for this product",

"add-first-issue-button": "Add your first issue"

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

{

"name": "Problèmes de produit",

"issue-column-heading": "Problème",

"status-column-heading": "Statut",

"select-label": "Statut",

"option-todo": "À faire",

"option-completed": "Terminé",

"delete-issue-button": "Supprimer le problème",

"edit-issue-button": "Modifier le problème",

"add-issue-button": "Ajouter un problème",

"collapsed-summary": "Pas assez de variantes de produit",

"no-issues-text": "Aucun problème pour ce produit",

"add-first-issue-button": "Ajouter votre premier problème"

}

999

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

import { render } from "preact";

import { useEffect, useMemo, useState } from "preact/hooks";

import { updateIssues, getIssues } from "./utils";

export default async () => {

{

render(<Extension />, document.body);

}

const PAGE\_SIZE = 3;

function Extension() {

const { data, i18n } = shopify;

const [loading, setLoading] = useState(true);

const [\_, setInitialValues] = useState([]);

const [issues, setIssues] = useState([]);

const [currentPage, setCurrentPage] = useState(1);

const productId = data.selected[0].id;

const issuesCount = issues.length;

const totalPages = issuesCount / PAGE\_SIZE;

useEffect(() => {

(async function getProductInfo() {

// Load the product's metafield of type issues

const productData = await getIssues(productId);

setLoading(false);

if (productData?.data?.product?.metafield?.value) {

const parsedIssues = JSON.parse(

productData.data.product.metafield.value,

);

setInitialValues(

parsedIssues.map(({ completed }) => Boolean(completed)),

);

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

### [Anchor to Next steps](https://shopify.dev/docs/apps/build/admin/actions-blocks/build-admin-block#next-steps)Next steps

[![](https://shopify.dev/images/icons/32/blocks.png)![](https://shopify.dev/images/icons/32/blocks-dark.png)

Connect admin and block UI extensions

In the next tutorial in this series, you'll connect your admin action UI extension to your admin block UI extension, to enable issue editing.

Connect admin and block UI extensions

In the next tutorial in this series, you'll connect your admin action UI extension to your admin block UI extension, to enable issue editing.](/docs/apps/admin/admin-actions-and-blocks/connect-action-and-block)

[Connect admin and block UI extensions](https://shopify.dev/docs/apps/admin/admin-actions-and-blocks/connect-action-and-block)

[![](https://shopify.dev/images/icons/32/blocks.png)![](https://shopify.dev/images/icons/32/blocks-dark.png)

Hide UI extensions

Learn how to hide action UI extensions when they're not useful or relevant.

Hide UI extensions

Learn how to hide action UI extensions when they're not useful or relevant.](/docs/apps/build/admin/actions-blocks/hide-extensions)

[Hide UI extensions](https://shopify.dev/docs/apps/build/admin/actions-blocks/hide-extensions)

[![](https://shopify.dev/images/icons/32/blocks.png)![](https://shopify.dev/images/icons/32/blocks-dark.png)

Extension targets

Learn about the various places that Shopify admin can display UI extensions.

Extension targets

Learn about the various places that Shopify admin can display UI extensions.](/docs/api/admin-extensions/extension-targets)

[Extension targets](https://shopify.dev/docs/api/admin-extensions/extension-targets)

[![](https://shopify.dev/images/icons/32/blocks.png)![](https://shopify.dev/images/icons/32/blocks-dark.png)

Components

Learn about the full set of available components for writing admin UI extensions.

Components

Learn about the full set of available components for writing admin UI extensions.](/docs/api/admin-extensions/components)

[Components](https://shopify.dev/docs/api/admin-extensions/components)

[![](https://shopify.dev/images/icons/32/build.png)![](https://shopify.dev/images/icons/32/build-dark.png)

Deploy

Learn how to deploy your UI extensions to merchants.

Deploy

Learn how to deploy your UI extensions to merchants.](/docs/apps/deployment/app-versions)

[Deploy](https://shopify.dev/docs/apps/deployment/app-versions)

Was this page helpful?

YesNo
