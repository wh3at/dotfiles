---
title: "Chef | Convex Developer Hub"
source_url: "https://docs.convex.dev/chef"
fetched_at: "2025-12-11T01:38:42.220821+00:00"
---



Copy as Markdown

Copied!

On this page

Chef is an AI app builder that builds complex full-stack apps. It leverages the
full power of the Convex platform to one-shot apps like Slack, Instagram, and
Notion.

This means Chef can: build real-time apps, upload files, do text search and take
advantage of Convex Components.

[## Prompt to start an app with Convex Chef](https://chef.convex.dev)

![Chef Screenshot](https://docs.convex.dev/assets/images/chef_preview-dfe305b7d7ebb5910c22cf2c22a6842d.png)

## Deploying to production[​](https://docs.convex.dev/chef.html#deploying-to-production "Direct link to Deploying to production")

Chef does have a built in ability to deploy your the dev version of your app for
you to immediately share with your friends to try.

For apps intended to be built and maintained over the long term, we recommend
downloading the code and importing it into your preferred IDE. When you download
the code from Chef, your project automatically comes with
[Cursor rules for Convex](https://docs.convex.dev/ai.html), helping you keep coding with confidence.

### Download the code[​](https://docs.convex.dev/chef.html#download-the-code "Direct link to Download the code")

![Chef Screenshot](data:image/png;base64,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)

At the top right of the Chef UI there is a download code button. Download the
code and you’ll get a zip file.

Unzip the file and put the folder in your desired location. We recommend
renaming the folder to the name of your app for convenience. For the rest of the
setup, open up the terminal and `cd` into your app:

```
cd ~/<app folder>
```

### Install dependencies[​](https://docs.convex.dev/chef.html#install-dependencies "Direct link to Install dependencies")

Run the following command to install all dependencies for your project

```
npm i
```

### Run your app[​](https://docs.convex.dev/chef.html#run-your-app "Direct link to Run your app")

Run the following command run your app, and setup Convex if you haven’t already.

```
npm run dev
```

Follow any instructions to login to Convex from your machine.

caution

You have now taken over from Chef for development of this app. Chef doesn't
have the ability to re-import a project or track any progress from outside it.
Going back to this project on Chef will cause conflicts in your project.

### Set up the frontend build script[​](https://docs.convex.dev/chef.html#set-up-the-frontend-build-script "Direct link to Set up the frontend build script")

Chef projects don’t come with a build script. So make sure to add the following
to your `package.json` file:

```
  "scripts": {
		//... other scripts
    "build": "vite build"
  },
```

### Recommended: Setup Git[​](https://docs.convex.dev/chef.html#recommended-setup-git "Direct link to Recommended: Setup Git")

In the terminal run the following three commands setup git for your app. The
downloaded code comes with a `.gitignore` file.

```
git init
git add --all
git commit -m "Initial commit"
```

It's also recommended you setup a remote git repository with
[GitHub](https://github.com/) if you're going to use the production hosting
guides below.

### Set up production frontend hosting[​](https://docs.convex.dev/chef.html#set-up-production-frontend-hosting "Direct link to Set up production frontend hosting")

Follow one of the Convex [hosting guides](https://docs.convex.dev/production/hosting/index.html) to
set up frontend hosting and continuous deployment of your frontend and backend
code.

### Initialize Convex Auth for Prod[​](https://docs.convex.dev/chef.html#initialize-convex-auth-for-prod "Direct link to Initialize Convex Auth for Prod")

Once you have a production deployment. You need to
[set up Convex Auth for production](https://labs.convex.dev/auth/production).

## Integrations[​](https://docs.convex.dev/chef.html#integrations "Direct link to Integrations")

### OpenAI[​](https://docs.convex.dev/chef.html#openai "Direct link to OpenAI")

If you ask Chef to use AI, by default it will try to use the built in OpenAI
proxy with a limited number of calls. This helps you prototype your AI app idea
quickly.

However, at some point the built in number of calls will run out and you'll need
to provide your own OpenAI API Key and remove the proxy URL.

So that means you'll have to find the code that looks like this:

```
const openai = new OpenAI({
  baseURL: process.env.CONVEX_OPENAI_BASE_URL,
  apiKey: process.env.CONVEX_OPENAI_API_KEY,
});
```

And remove the baseURL parameter:

```
const openai = new OpenAI({
  apiKey: process.env.CONVEX_OPENAI_API_KEY,
});
```

Chef may automatically prompt you to change the environment variable. But if it
doesn't, you can change it by going to the "Database" tab. Then click on
Settings > Environment Variables and change `CONVEX_OPENAI_API_KEY` to your
[personal OpenAI key](https://platform.openai.com).

We plan on making this transition better over time.

### Resend[​](https://docs.convex.dev/chef.html#resend "Direct link to Resend")

Chef comes with a built in way to send emails to yourself via Resend. You can
only send emails to the account you used to log into Chef. To send emails to
anyone, you have to setup your app for production with a domain name. This is a
limitation of how email providers work to combat spam.

## FAQs[​](https://docs.convex.dev/chef.html#faqs "Direct link to FAQs")

### What browsers does Chef support?[​](https://docs.convex.dev/chef.html#what-browsers-does-chef-support "Direct link to What browsers does Chef support?")

Chef is best used on desktop/laptop browsers. It may work on some tablet or
mobile browsers. Chef does not work in Safari on any platform.

### How does the pricing for Chef work?[​](https://docs.convex.dev/chef.html#how-does-the-pricing-for-chef-work "Direct link to How does the pricing for Chef work?")

Chef pricing is primarily based on AI token usage. The free plan gives you
enough tokens to build the first version of your app in a small number of
prompts. After that you can upgrade to the Starter plan that where you can pay
for tokens as you go.

### What’s the difference between Chef and Convex?[​](https://docs.convex.dev/chef.html#whats-the-difference-between-chef-and-convex "Direct link to What’s the difference between Chef and Convex?")

Chef is an AI app builder that builds full-stack apps. Convex is the backend and
database that powers Chef.

### Can I import my existing app to Chef?[​](https://docs.convex.dev/chef.html#can-i-import-my-existing-app-to-chef "Direct link to Can I import my existing app to Chef?")

Chef currently doesn’t have import and GitHub integration. But you can get most
of the value by setting up the [Convex AI Rules and MCP server](https://docs.convex.dev/ai.html) in your
Agentic IDE like Cursor.

### Are there any best practices for Chef?[​](https://docs.convex.dev/chef.html#are-there-any-best-practices-for-chef "Direct link to Are there any best practices for Chef?")

Yes! Check out this
[tips post written by one of our engineers](https://stack.convex.dev/chef-cookbook-tips-working-with-ai-app-builders).

### What Convex Components can Chef use?[​](https://docs.convex.dev/chef.html#what-convex-components-can-chef-use "Direct link to What Convex Components can Chef use?")

Chef can use the
[collaborative text editor](https://www.convex.dev/components/prosemirror-sync)
component and the [presence](https://www.convex.dev/components/presence)
component. We will support more components soon. Chef supports all other Convex
features like text search, file storage, etc.

## Limitations[​](https://docs.convex.dev/chef.html#limitations "Direct link to Limitations")

Chef works off a singular template with Convex, Convex Auth and React powered by
Vite. Switching these technologies is not supported by Chef.

[Previous

Usage Tracking](https://docs.convex.dev/agents/usage-tracking.html)[Next

Testing](https://docs.convex.dev/testing.html)

* [Deploying to production](https://docs.convex.dev/chef.html#deploying-to-production)
  + [Download the code](https://docs.convex.dev/chef.html#download-the-code)
  + [Install dependencies](https://docs.convex.dev/chef.html#install-dependencies)
  + [Run your app](https://docs.convex.dev/chef.html#run-your-app)
  + [Set up the frontend build script](https://docs.convex.dev/chef.html#set-up-the-frontend-build-script)
  + [Recommended: Setup Git](https://docs.convex.dev/chef.html#recommended-setup-git)
  + [Set up production frontend hosting](https://docs.convex.dev/chef.html#set-up-production-frontend-hosting)
  + [Initialize Convex Auth for Prod](https://docs.convex.dev/chef.html#initialize-convex-auth-for-prod)
* [Integrations](https://docs.convex.dev/chef.html#integrations)
  + [OpenAI](https://docs.convex.dev/chef.html#openai)
  + [Resend](https://docs.convex.dev/chef.html#resend)
* [FAQs](https://docs.convex.dev/chef.html#faqs)
  + [What browsers does Chef support?](https://docs.convex.dev/chef.html#what-browsers-does-chef-support)
  + [How does the pricing for Chef work?](https://docs.convex.dev/chef.html#how-does-the-pricing-for-chef-work)
  + [What’s the difference between Chef and Convex?](https://docs.convex.dev/chef.html#whats-the-difference-between-chef-and-convex)
  + [Can I import my existing app to Chef?](https://docs.convex.dev/chef.html#can-i-import-my-existing-app-to-chef)
  + [Are there any best practices for Chef?](https://docs.convex.dev/chef.html#are-there-any-best-practices-for-chef)
  + [What Convex Components can Chef use?](https://docs.convex.dev/chef.html#what-convex-components-can-chef-use)
* [Limitations](https://docs.convex.dev/chef.html#limitations)
