---
title: "Build a print UI extension"
source_url: "https://shopify.dev/docs/apps/build/pos/build-print-extension"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



This tutorial shows you how to create a print extension that lets merchants generate and preview documents before printing.

## [Anchor to What you'll learn:](https://shopify.dev/docs/apps/build/pos/build-print-extension?extension=polaris#what-youll-learn)What you'll learn:

* Create a backend service that serves print-ready documents.
* Build a POS UI extension with preview and print capabilities.
* Implement error handling for a reliable printing experience.
* Test your extension in a development environment.

![Print Extension in Action](https://cdn.shopify.com/shopifycloud/shopify-dev/production/assets/assets/apps/pos/pos-ui-extensions-print-example-C4NFZVcv.gif)

## Requirements

[Create a Partner account](https://www.shopify.com/partners)

[Create a development store](https://shopify.dev/docs/apps/tools/development-stores#create-a-development-store-to-test-your-app)

[Scaffold an app](https://shopify.dev/docs/apps/build/scaffold-app)

Scaffold an app that uses the [React Router template](https://github.com/Shopify/shopify-app-template-react-router).

[Generate a POS UI extension](https://shopify.dev/docs/apps/build/pos/getting-started)

Generate a POS UI extension using Shopify CLI.

Access scopes

If you plan to include order, customer, or any other Shopify admin data in your prints, you'll need additional access scopes. This tutorial doesn't include any admin data as the core focus is to build the extension itself, so no additional access scopes are required.

[Learn more about access scopes](https://shopify.dev/docs/api/usage/access-scopes)

## Project

Extension:

Polaris

Polaris

### [Anchor to Create a route to serve printable documents](https://shopify.dev/docs/apps/build/pos/build-print-extension?extension=polaris#create-a-route-to-serve-printable-documents)Create a route to serve printable documents

First, create a new route file at `app/routes/print.ts` that serves your printable documents. This example uses [React Router](https://reactrouter.com/start/framework/routing#route-modules), but you can adapt the concepts to your preferred framework.

> Need help setting up a React Router server? Check out the [Shopify App React Router documentation](https://shopify.dev/docs/api/shopify-app-react-router).

Let's walk through each part of the implementation:

Set up the route and handle authentication with Shopify.

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

// This example shows how to create a print endpoint for your Shopify app

// This works with both Remix and React Router v7 (which uses Remix's API patterns)

// Place this file in your app's routes folder to create a route at '/print'

import {authenticate} from '../shopify.server';

export async function loader({request}) {

const {cors} = await authenticate.admin(request);

const url = new URL(request.url);

const printTypes = url.searchParams.get('printTypes')?.split(',') || [];

const pages = printTypes.map((type) => createPage(type));

const print = printHTML(pages);

return cors(

new Response(print, {

status: 200,

headers: {

'Content-type': 'text/html',

},

}),

);

}

// Helper function to create document pages based on type

function createPage(type) {

const email = '<!--email\_off-->customerhelp@example.com<!--/email\_off-->';

// Get document content based on type (invoice, packing slip, etc.)

const getDocumentInfo = () => {

switch (type) {

case 'invoice':

return {

label: 'Receipt / Invoice',

content: `

Process URL parameters to determine which documents to generate.

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

// This example shows how to create a print endpoint for your Shopify app

// This works with both Remix and React Router v7 (which uses Remix's API patterns)

// Place this file in your app's routes folder to create a route at '/print'

import {authenticate} from '../shopify.server';

export async function loader({request}) {

const {cors} = await authenticate.admin(request);

const url = new URL(request.url);

const printTypes = url.searchParams.get('printTypes')?.split(',') || [];

const pages = printTypes.map((type) => createPage(type));

const print = printHTML(pages);

return cors(

new Response(print, {

status: 200,

headers: {

'Content-type': 'text/html',

},

}),

);

}

// Helper function to create document pages based on type

function createPage(type) {

const email = '<!--email\_off-->customerhelp@example.com<!--/email\_off-->';

// Get document content based on type (invoice, packing slip, etc.)

const getDocumentInfo = () => {

switch (type) {

case 'invoice':

return {

label: 'Receipt / Invoice',

content: `

Generate HTML content with proper styling for each document type.

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

// This example shows how to create a print endpoint for your Shopify app

// This works with both Remix and React Router v7 (which uses Remix's API patterns)

// Place this file in your app's routes folder to create a route at '/print'

import {authenticate} from '../shopify.server';

export async function loader({request}) {

const {cors} = await authenticate.admin(request);

const url = new URL(request.url);

const printTypes = url.searchParams.get('printTypes')?.split(',') || [];

const pages = printTypes.map((type) => createPage(type));

const print = printHTML(pages);

return cors(

new Response(print, {

status: 200,

headers: {

'Content-type': 'text/html',

},

}),

);

}

// Helper function to create document pages based on type

function createPage(type) {

const email = '<!--email\_off-->customerhelp@example.com<!--/email\_off-->';

// Get document content based on type (invoice, packing slip, etc.)

const getDocumentInfo = () => {

switch (type) {

case 'invoice':

return {

label: 'Receipt / Invoice',

content: `

Return a properly formatted response with CORS headers.

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

// This example shows how to create a print endpoint for your Shopify app

// This works with both Remix and React Router v7 (which uses Remix's API patterns)

// Place this file in your app's routes folder to create a route at '/print'

import {authenticate} from '../shopify.server';

export async function loader({request}) {

const {cors} = await authenticate.admin(request);

const url = new URL(request.url);

const printTypes = url.searchParams.get('printTypes')?.split(',') || [];

const pages = printTypes.map((type) => createPage(type));

const print = printHTML(pages);

return cors(

new Response(print, {

status: 200,

headers: {

'Content-type': 'text/html',

},

}),

);

}

// Helper function to create document pages based on type

function createPage(type) {

const email = '<!--email\_off-->customerhelp@example.com<!--/email\_off-->';

// Get document content based on type (invoice, packing slip, etc.)

const getDocumentInfo = () => {

switch (type) {

case 'invoice':

return {

label: 'Receipt / Invoice',

content: `

Print document requirements

* Use only static HTML and CSS - JavaScript won't execute in print documents.
* Include all styles in the `<head>` section or inline.
* Use `@media print` CSS rules for print-specific styling.
* Ensure proper CORS headers are set for POS access.

Page breaks

When returning multiple documents, use CSS page breaks to ensure proper printing:

9

1

2

3

4

5

@media print {

.page-break {

page-break-after: always;

}

}

Email obfuscation

When using Cloudflare tunnels for development, wrap email addresses in HTML comments to prevent obfuscation:

`<!--email_off-->example@email.com<!--/email_off-->`

[Learn more about email obfuscation](https://developers.cloudflare.com/waf/tools/scrape-shield/email-address-obfuscation/#prevent-cloudflare-from-obfuscating-email)

### [Anchor to Build the extension tile](https://shopify.dev/docs/apps/build/pos/build-print-extension?extension=polaris#build-the-extension-tile)Build the extension tile

Next, you'll build a modal where users interact with your app. You'll add the functionality that implements the printing workflow.

Build a **Tile** on the POS smart grid that launches your extension.

### [Anchor to Build the extension modal](https://shopify.dev/docs/apps/build/pos/build-print-extension?extension=polaris#build-the-extension-modal)Build the extension modal

Next, you'll build a modal where users interact with your app. You'll add the functionality that implements the printing workflow.

Initialize the loading and document list state.

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

import {render} from 'preact';

import {useState, useEffect} from 'preact/hooks';

export default function extension() {

render(<Modal />, document.body);

}

function Modal() {

const [isLoading, setIsLoading] = useState(false);

const [documents, setDocuments] = useState([

{

id: 'invoice',

label: 'Receipt / Invoice',

subtitle:

'Print a detailed sales receipt with tax and payment information',

selected: true,

},

{

id: 'packing-slip',

label: 'Packing Slip',

subtitle: 'Print shipping details and item list for order fulfillment',

selected: false,

},

{

id: 'returns-form',

label: 'Returns Form',

subtitle: 'Print return authorization form with shipping labels',

selected: false,

},

{

id: 'draft-orders-quote',

label: 'Draft Orders Quote',

subtitle: 'Print price quotes and custom order details for customers',

selected: false,

},

{

Set up document selection with an `s-choice-list` component.

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

import {render} from 'preact';

import {useState, useEffect} from 'preact/hooks';

export default function extension() {

render(<Modal />, document.body);

}

function Modal() {

const [isLoading, setIsLoading] = useState(false);

const [documents, setDocuments] = useState([

{

id: 'invoice',

label: 'Receipt / Invoice',

subtitle:

'Print a detailed sales receipt with tax and payment information',

selected: true,

},

{

id: 'packing-slip',

label: 'Packing Slip',

subtitle: 'Print shipping details and item list for order fulfillment',

selected: false,

},

{

id: 'returns-form',

label: 'Returns Form',

subtitle: 'Print return authorization form with shipping labels',

selected: false,

},

{

id: 'draft-orders-quote',

label: 'Draft Orders Quote',

subtitle: 'Print price quotes and custom order details for customers',

selected: false,

},

{

Handle document selection and URL updates.

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

import {render} from 'preact';

import {useState, useEffect} from 'preact/hooks';

export default function extension() {

render(<Modal />, document.body);

}

function Modal() {

const [isLoading, setIsLoading] = useState(false);

const [documents, setDocuments] = useState([

{

id: 'invoice',

label: 'Receipt / Invoice',

subtitle:

'Print a detailed sales receipt with tax and payment information',

selected: true,

},

{

id: 'packing-slip',

label: 'Packing Slip',

subtitle: 'Print shipping details and item list for order fulfillment',

selected: false,

},

{

id: 'returns-form',

label: 'Returns Form',

subtitle: 'Print return authorization form with shipping labels',

selected: false,

},

{

id: 'draft-orders-quote',

label: 'Draft Orders Quote',

subtitle: 'Print price quotes and custom order details for customers',

selected: false,

},

{

Implement print functionality with error handling.

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

import {render} from 'preact';

import {useState, useEffect} from 'preact/hooks';

export default function extension() {

render(<Modal />, document.body);

}

function Modal() {

const [isLoading, setIsLoading] = useState(false);

const [documents, setDocuments] = useState([

{

id: 'invoice',

label: 'Receipt / Invoice',

subtitle:

'Print a detailed sales receipt with tax and payment information',

selected: true,

},

{

id: 'packing-slip',

label: 'Packing Slip',

subtitle: 'Print shipping details and item list for order fulfillment',

selected: false,

},

{

id: 'returns-form',

label: 'Returns Form',

subtitle: 'Print return authorization form with shipping labels',

selected: false,

},

{

id: 'draft-orders-quote',

label: 'Draft Orders Quote',

subtitle: 'Print price quotes and custom order details for customers',

selected: false,

},

{

Key components

* The `s-tile` component uses `api.action.presentModal()` to open the modal.
* The `s-list` component with toggle switches for document selection.
* The `s-document-preview` component shows selected documents before printing.
* Loading states and error handling ensure a smooth user experience.

### [Anchor to Configure your extension](https://shopify.dev/docs/apps/build/pos/build-print-extension?extension=polaris#configure-your-extension)Configure your extension

Configure your extension with the necessary permissions and settings in the `shopify.extension.toml` file:

### [Anchor to Testing your extension](https://shopify.dev/docs/apps/build/pos/build-print-extension?extension=polaris#testing-your-extension)Testing your extension

To test your print extension:

Navigate to your app directory:

9

1

cd <directory>

Start your development server:

9

1

shopify app dev

Press `p` to open the developer console.

In the developer console, click on the **view mobile** to preview your extension.

* [Learn more about how to test your extension](https://shopify.dev/docs/apps/build/pos/getting-started#step-2-run-the-local-extension-in-your-development-store)

Click the **Print Tutorial** tile.

Select a template, press **next**, and then **print**.

Congratulations! You've built a print extension that generates, previews, and prints custom documents.

Testing tip

Use your browser's developer tools to monitor network requests and check for any CORS or authentication issues.

### [Anchor to Deploy and release](https://shopify.dev/docs/apps/build/pos/build-print-extension?extension=polaris#deploy-and-release)Deploy and release

Refer to [Deploy app extensions](https://shopify.dev/docs/apps/deployment/app-versions) for more information.

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

// This example shows how to create a print endpoint for your Shopify app

// This works with both Remix and React Router v7 (which uses Remix's API patterns)

// Place this file in your app's routes folder to create a route at '/print'

import {authenticate} from '../shopify.server';

export async function loader({request}) {

const {cors} = await authenticate.admin(request);

const url = new URL(request.url);

const printTypes = url.searchParams.get('printTypes')?.split(',') || [];

const pages = printTypes.map((type) => createPage(type));

const print = printHTML(pages);

return cors(

new Response(print, {

status: 200,

headers: {

'Content-type': 'text/html',

},

}),

);

}

// Helper function to create document pages based on type

function createPage(type) {

const email = '<!--email\_off-->customerhelp@example.com<!--/email\_off-->';

// Get document content based on type (invoice, packing slip, etc.)

const getDocumentInfo = () => {

switch (type) {

case 'invoice':

return {

label: 'Receipt / Invoice',

content: `

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

import {render} from 'preact';

export default function extension() {

render(<HomeTile />, document.body);

}

function HomeTile() {

return (

<s-tile

heading="Print Tutorial"

onClick={() => shopify.action.presentModal()}

/>

);

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

import {render} from 'preact';

import {useState, useEffect} from 'preact/hooks';

export default function extension() {

render(<Modal />, document.body);

}

function Modal() {

const [isLoading, setIsLoading] = useState(false);

const [documents, setDocuments] = useState([

{

id: 'invoice',

label: 'Receipt / Invoice',

subtitle:

'Print a detailed sales receipt with tax and payment information',

selected: true,

},

{

id: 'packing-slip',

label: 'Packing Slip',

subtitle: 'Print shipping details and item list for order fulfillment',

selected: false,

},

{

id: 'returns-form',

label: 'Returns Form',

subtitle: 'Print return authorization form with shipping labels',

selected: false,

},

{

id: 'draft-orders-quote',

label: 'Draft Orders Quote',

subtitle: 'Print price quotes and custom order details for customers',

selected: false,

},

{

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

api\_version = "2025-10"

[[extensions]]

type = "ui\_extension"

name = "Print Tutorial"

handle = "print-tutorial"

uid = "ccf7edf4-a12d-b60a-9d4a-1cb8691864d6ec6a83e2"

description = "POS UI extension print tutorial"

[[extensions.targeting]]

module = "./src/HomeTile.tsx"

target = "pos.home.tile.render"

[[extensions.targeting]]

module = "./src/HomeModal.tsx"

target = "pos.home.modal.render"

### [Anchor to Learn more](https://shopify.dev/docs/apps/build/pos/build-print-extension?extension=polaris#learn-more)Learn more

[![](https://shopify.dev/images/icons/32/shopify.png)![](https://shopify.dev/images/icons/32/shopify-dark.png)

Learn more about POS UI extensions

Learn more about POS UI extensions](/docs/api/pos-ui-extensions)

[Learn more about POS UI extensions](https://shopify.dev/docs/api/pos-ui-extensions)

[![](https://shopify.dev/images/icons/32/liquidpackingsliptemplate.png)![](https://shopify.dev/images/icons/32/liquidpackingsliptemplate-dark.png)

Print API documentation

Print API documentation](/docs/api/pos-ui-extensions/apis/print-api)

[Print API documentation](https://shopify.dev/docs/api/pos-ui-extensions/apis/print-api)

Was this page helpful?

YesNo
