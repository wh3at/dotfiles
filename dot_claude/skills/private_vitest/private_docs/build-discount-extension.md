---
title: "Build a discount UI extension"
source_url: "https://shopify.dev/docs/apps/build/pos/build-discount-extension"
fetched_at: "2025-12-11T04:49:28.191885+00:00"
---



This tutorial shows you how to use the `pos.home.tile.render` and `pos.home.modal.render` [extension targets](https://shopify.dev/docs/api/pos-ui-extensions/targets) to build a simple POS UI extension that quickly applies discounts to items in the cart.

You'll create a smart grid tile that's enabled after a cart reaches a specified value. Tapping the tile opens a modal displaying buttons for available discounts. Pressing a button applies a discount to the cart and presents a success notification.

![POS UI extensions discount example app](https://cdn.shopify.com/shopifycloud/shopify-dev/production/assets/assets/apps/pos/pos-ui-extensions-discount-example-rD_1VavG.gif)

## [Anchor to What you'll learn](https://shopify.dev/docs/apps/build/pos/build-discount-extension?extension=polaris#what-youll-learn)What you'll learn

In this tutorial, you'll learn how to do the following tasks:

* Subscribe to cart changes.
* Enable or disable the tile based on cart contents.
* Add buttons to the modal that apply a discount and show a toast when tapped.
* Deploy your extension to Shopify, create a version, and publish.

## Requirements

[Create a Partner account](https://www.shopify.com/partners)

[Create a development store](https://shopify.dev/docs/apps/tools/development-stores#create-a-development-store-to-test-your-app)

[Scaffold an app](https://shopify.dev/docs/apps/build/scaffold-app)

Scaffold an app using Shopify CLI. This tutorial is compatible with the
[extension-only template](https://shopify.dev/docs/apps/structure/app-extensions/extension-only-apps).

[Generate a POS UI extension](https://shopify.dev/docs/apps/build/pos/getting-started)

Generate a POS UI extension using the Shopify CLI.

## Project

Extension:

Polaris

Polaris

### [Anchor to Subscribe to cart changes](https://shopify.dev/docs/apps/build/pos/build-discount-extension?extension=polaris#subscribe-to-cart-changes)Subscribe to cart changes

You previously created an app and generated a POS UI extension using Shopify CLI. You now need to subscribe to cart changes to get the contents of a cart. By subscribing to cart changes, you'll be able to control whether the smart grid tile is enabled after a cart reaches a specified value.

In the tile code, subscribe to cart changes and mutate the state based on the updated cart.

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

import {render} from 'preact';

import {useState, useEffect} from 'preact/hooks';

export default function extension() {

render(<SmartGridTile />, document.body);

}

function SmartGridTile() {

const shouldDisable = (subtotal) => {

return Number(subtotal) <= 100;

};

const [disabled, setDisabled] = useState(

shouldDisable(shopify.cart.current.value.subtotal),

);

useEffect(() => {

const unsubscribe = shopify.cart.current.subscribe((cart) => {

setDisabled(shouldDisable(cart.subtotal));

});

return unsubscribe;

}, []);

return (

<s-tile

heading="Discount Example App"

subheading="Preact"

onClick={() => shopify.action.presentModal()}

disabled={disabled}

/>

);

}

### [Anchor to Enable or disable the tile based on cart contents](https://shopify.dev/docs/apps/build/pos/build-discount-extension?extension=polaris#enable-or-disable-the-tile-based-on-cart-contents)Enable or disable the tile based on cart contents

With the cart contents in place, you can now enable or disable the tile based on cart contents. You can enable or disable the tile based on cart contents by accessing its `subscribable` property.

In the tile code, initialize the state based on the initial value of the `subscribable` property.

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

import {render} from 'preact';

import {useState, useEffect} from 'preact/hooks';

export default function extension() {

render(<SmartGridTile />, document.body);

}

function SmartGridTile() {

const shouldDisable = (subtotal) => {

return Number(subtotal) <= 100;

};

const [disabled, setDisabled] = useState(

shouldDisable(shopify.cart.current.value.subtotal),

);

useEffect(() => {

const unsubscribe = shopify.cart.current.subscribe((cart) => {

setDisabled(shouldDisable(cart.subtotal));

});

return unsubscribe;

}, []);

return (

<s-tile

heading="Discount Example App"

subheading="Preact"

onClick={() => shopify.action.presentModal()}

disabled={disabled}

/>

);

}

### [Anchor to Add buttons](https://shopify.dev/docs/apps/build/pos/build-discount-extension?extension=polaris#add-buttons)Add buttons

With the cart contents in place, you can now add buttons to the modal that apply a discount and display a toast when tapped. You can add buttons to the modal that trigger some action on press.

Create the buttons on the modal. Note that most components belong in an `s-scroll-box`, so that the UI will work well on different device sizes, and can scroll as needed.

### [Anchor to Define a function to trigger an action](https://shopify.dev/docs/apps/build/pos/build-discount-extension?extension=polaris#define-a-function-to-trigger-an-action)Define a function to trigger an action

To trigger an action when a user clicks the button, you need to define an `onClick` function. In the context of this tutorial, you'll apply the discount and show the toast.

Define an `onClick` function to apply the discount and show the toast.

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

import {render} from 'preact';

export default function extension() {

render(<SmartGridModal />, document.body);

}

function SmartGridModal() {

const onButtonClick = (type, title, amount) => {

shopify.cart.applyCartDiscount(type, title, amount);

shopify.toast.show('Discount applied');

};

return (

<s-page title="Available Discounts">

<s-scroll-box padding='base'>

<s-button

onClick={() => onButtonClick('Percentage', '25% off', '25')}

>

25%

</s-button>

<s-button

onClick={() => onButtonClick('FixedAmount', '$10 off', '10')}

>

$10

</s-button>

</s-scroll-box>

</s-page>

);

}

### [Anchor to Add a description for your extension](https://shopify.dev/docs/apps/build/pos/build-discount-extension?extension=polaris#add-a-description-for-your-extension)Add a description for your extension

In POS, the description is used to help merchants discover and add your extension. This description is used as the label for your extension in POS.

Your extension's description is visible to the merchant when they discover and add it to their POS.

![Extension description](https://cdn.shopify.com/shopifycloud/shopify-dev/production/assets/assets/apps/pos/ui-ext-description-BH4tZmFj.png)

When you generate a POS UI extension from Shopify CLI, the extension description defaults to the name of the extension. You can update the description in the generated `toml` file (`shopify.extension.toml`).

### [Anchor to Test the extension](https://shopify.dev/docs/apps/build/pos/build-discount-extension?extension=polaris#test-the-extension)Test the extension

To test the extension, you'll need to run your app locally and test the extension in the POS.

1. Navigate to your app directory and start your development server.
2. Press `p` to open the developer console.
3. In the developer console, click on the **view mobile** button or scan the provided QR code to preview your extension.

### [Anchor to Deploy and release](https://shopify.dev/docs/apps/build/pos/build-discount-extension?extension=polaris#deploy-and-release)Deploy and release

Congratulations! You've created a POS UI extension that applies discounts to items in the cart. Now you can deploy and release your extension.

Refer to [Deploy app extensions](https://shopify.dev/docs/apps/deployment/app-versions) for more information.

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

import {render} from 'preact';

import {useState, useEffect} from 'preact/hooks';

export default function extension() {

render(<SmartGridTile />, document.body);

}

function SmartGridTile() {

const shouldDisable = (subtotal) => {

return Number(subtotal) <= 100;

};

const [disabled, setDisabled] = useState(

shouldDisable(shopify.cart.current.value.subtotal),

);

useEffect(() => {

const unsubscribe = shopify.cart.current.subscribe((cart) => {

setDisabled(shouldDisable(cart.subtotal));

});

return unsubscribe;

}, []);

return (

<s-tile

heading="Discount Example App"

subheading="Preact"

onClick={() => shopify.action.presentModal()}

disabled={disabled}

/>

);

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

import {render} from 'preact';

export default function extension() {

render(<SmartGridModal />, document.body);

}

function SmartGridModal() {

const onButtonClick = (type, title, amount) => {

shopify.cart.applyCartDiscount(type, title, amount);

shopify.toast.show('Discount applied');

};

return (

<s-page title="Available Discounts">

<s-scroll-box padding='base'>

<s-button

onClick={() => onButtonClick('Percentage', '25% off', '25')}

>

25%

</s-button>

<s-button

onClick={() => onButtonClick('FixedAmount', '$10 off', '10')}

>

$10

</s-button>

</s-scroll-box>

</s-page>

);

}

9

1

2

3

4

5

6

7

...

name = "Discount"

handle = "discount"

uid = "bdff5acd-d192-ddcd-05cf-ad6d759e978ac7c62980"

description = "Add discount"

...

Was this page helpful?

YesNo
