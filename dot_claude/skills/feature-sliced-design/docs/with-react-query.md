---
title: "Usage with React Query | Feature-Sliced Design"
source_url: "https://feature-sliced.design/docs/guides/tech/with-react-query"
fetched_at: "2025-12-24T01:59:28.495697+00:00"
---



* * 🎯 Guides* Tech* Usage with React Query

On this page

## The problem of “where to put the keys”[​](https://feature-sliced.design/docs/guides/tech/with-react-query.html#the-problem-of-where-to-put-the-keys "Direct link to heading")

### Solution — break down by entities[​](https://feature-sliced.design/docs/guides/tech/with-react-query.html#solution--break-down-by-entities "Direct link to heading")

If the project already has a division into entities, and each request corresponds to a single entity,
the purest division will be by entity. In this case, we suggest using the following structure:

```
└── src/                                        #
    ├── app/                                    #
    |   ...                                     #
    ├── pages/                                  #
    |   ...                                     #
    ├── entities/                               #
    |     ├── {entity}/                         #
    |    ...     └── api/                       #
    |                 ├── `{entity}.query`      # Query-factory where are the keys and functions
    |                 ├── `get-{entity}`        # Entity getter function
    |                 ├── `create-{entity}`     # Entity creation function
    |                 ├── `update-{entity}`     # Entity update function
    |                 ├── `delete-{entity}`     # Entity delete function
    |                ...                        #
    |                                           #
    ├── features/                               #
    |   ...                                     #
    ├── widgets/                                #
    |   ...                                     #
    └── shared/                                 #
        ...                                     #
```

If there are connections between the entities (for example, the Country entity has a field-list of City entities),
then you can use the [public API for cross-imports](https://feature-sliced.design/docs/reference/public-api#public-api-for-cross-imports) or consider the alternative solution below.

### Alternative solution — keep it in shared[​](https://feature-sliced.design/docs/guides/tech/with-react-query.html#alternative-solution--keep-it-in-shared "Direct link to heading")

In cases where entity separation is not appropriate, the following structure can be considered:

```
└── src/                                        #
   ...                                          #
    └── shared/                                 #
          ├── api/                              #
         ...   ├── `queries`                    # Query-factories
               |      ├── `document.ts`         #
               |      ├── `background-jobs.ts`  #
               |     ...                        #
               └──  index.ts                    #
```

Then in `@/shared/api/index.ts`:

@/shared/api/index.ts

```
export { documentQueries } from "./queries/document";
```

## The problem of “Where to insert mutations?”[​](https://feature-sliced.design/docs/guides/tech/with-react-query.html#the-problem-of-where-to-insert-mutations "Direct link to heading")

It is not recommended to mix mutations with queries. There are two options:

### 1. Define a custom hook in the `api` segment near the place of use[​](https://feature-sliced.design/docs/guides/tech/with-react-query.html#1-define-a-custom-hook-in-the-api-segment-near-the-place-of-use "Direct link to heading")

@/features/update-post/api/use-update-title.ts

```
export const useUpdateTitle = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: ({ id, newTitle }) =>
      apiClient
        .patch(`/posts/${id}`, { title: newTitle })
        .then((data) => console.log(data)),

    onSuccess: (newPost) => {
      queryClient.setQueryData(postsQueries.ids(id), newPost);
    },
  });
};
```

### 2. Define a mutation function somewhere else (Shared or Entities) and use `useMutation` directly in the component[​](https://feature-sliced.design/docs/guides/tech/with-react-query.html#2-define-a-mutation-function-somewhere-else-shared-or-entities-and-use-usemutation-directly-in-the-component "Direct link to heading")

```
const { mutateAsync, isPending } = useMutation({
  mutationFn: postApi.createPost,
});
```

@/pages/post-create/ui/post-create-page.tsx

```
export const CreatePost = () => {
  const { classes } = useStyles();
  const [title, setTitle] = useState("");

  const { mutate, isPending } = useMutation({
    mutationFn: postApi.createPost,
  });

  const handleChange = (e: ChangeEvent<HTMLInputElement>) =>
    setTitle(e.target.value);
  const handleSubmit = (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    mutate({ title, userId: DEFAULT_USER_ID });
  };

  return (
    <form className={classes.create_form} onSubmit={handleSubmit}>
      <TextField onChange={handleChange} value={title} />
      <LoadingButton type="submit" variant="contained" loading={isPending}>
        Create
      </LoadingButton>
    </form>
  );
};
```

## Organization of requests[​](https://feature-sliced.design/docs/guides/tech/with-react-query.html#organization-of-requests "Direct link to heading")

### Query factory[​](https://feature-sliced.design/docs/guides/tech/with-react-query.html#query-factory "Direct link to heading")

A query factory is an object where the key values are functions that return a list of query keys. Here's how to use it:

```
const keyFactory = {
  all: () => ["entity"],
  lists: () => [...postQueries.all(), "list"],
};
```

info

`queryOptions` is a built-in utility in react-query@v5 (optional)

```
queryOptions({
  queryKey,
  ...options,
});
```

For greater type safety, further compatibility with future versions of react-query, and easy access to functions and query keys,
you can use the built-in queryOptions function from “@tanstack/react-query”
[(More details here)](https://tkdodo.eu/blog/the-query-options-api#queryoptions).

### 1. Creating a Query Factory[​](https://feature-sliced.design/docs/guides/tech/with-react-query.html#1-creating-a-query-factory "Direct link to heading")

@/entities/post/api/post.queries.ts

```
import { keepPreviousData, queryOptions } from "@tanstack/react-query";
import { getPosts } from "./get-posts";
import { getDetailPost } from "./get-detail-post";
import { PostDetailQuery } from "./query/post.query";

export const postQueries = {
  all: () => ["posts"],

  lists: () => [...postQueries.all(), "list"],
  list: (page: number, limit: number) =>
    queryOptions({
      queryKey: [...postQueries.lists(), page, limit],
      queryFn: () => getPosts(page, limit),
      placeholderData: keepPreviousData,
    }),

  details: () => [...postQueries.all(), "detail"],
  detail: (query?: PostDetailQuery) =>
    queryOptions({
      queryKey: [...postQueries.details(), query?.id],
      queryFn: () => getDetailPost({ id: query?.id }),
      staleTime: 5000,
    }),
};
```

### 2. Using Query Factory in application code[​](https://feature-sliced.design/docs/guides/tech/with-react-query.html#2-using-query-factory-in-application-code "Direct link to heading")

```
import { useParams } from "react-router-dom";
import { postApi } from "@/entities/post";
import { useQuery } from "@tanstack/react-query";

type Params = {
  postId: string;
};

export const PostPage = () => {
  const { postId } = useParams<Params>();
  const id = parseInt(postId || "");
  const {
    data: post,
    error,
    isLoading,
    isError,
  } = useQuery(postApi.postQueries.detail({ id }));

  if (isLoading) {
    return <div>Loading...</div>;
  }

  if (isError || !post) {
    return <>{error?.message}</>;
  }

  return (
    <div>
      <p>Post id: {post.id}</p>
      <div>
        <h1>{post.title}</h1>
        <div>
          <p>{post.body}</p>
        </div>
      </div>
      <div>Owner: {post.userId}</div>
    </div>
  );
};
```

### Benefits of using a Query Factory[​](https://feature-sliced.design/docs/guides/tech/with-react-query.html#benefits-of-using-a-query-factory "Direct link to heading")

* **Request structuring:** A factory allows you to organize all API requests in one place, making your code more readable and maintainable.
* **Convenient access to queries and keys:** The factory provides convenient methods for accessing different types of queries and their keys.
* **Query Refetching Ability:** The factory allows easy refetching without the need to change query keys in different parts of the application.

## Pagination[​](https://feature-sliced.design/docs/guides/tech/with-react-query.html#pagination "Direct link to heading")

In this section, we'll look at an example of the `getPosts` function, which makes an API request to retrieve post entities using pagination.

### 1. Creating a function `getPosts`[​](https://feature-sliced.design/docs/guides/tech/with-react-query.html#1-creating-a-function-getposts "Direct link to heading")

The getPosts function is located in the `get-posts.ts` file, which is located in the `api` segment

@/pages/post-feed/api/get-posts.ts

```
import { apiClient } from "@/shared/api/base";

import { PostWithPaginationDto } from "./dto/post-with-pagination.dto";
import { PostQuery } from "./query/post.query";
import { mapPost } from "./mapper/map-post";
import { PostWithPagination } from "../model/post-with-pagination";

const calculatePostPage = (totalCount: number, limit: number) =>
  Math.floor(totalCount / limit);

export const getPosts = async (
  page: number,
  limit: number,
): Promise<PostWithPagination> => {
  const skip = page * limit;
  const query: PostQuery = { skip, limit };
  const result = await apiClient.get<PostWithPaginationDto>("/posts", query);

  return {
    posts: result.posts.map((post) => mapPost(post)),
    limit: result.limit,
    skip: result.skip,
    total: result.total,
    totalPages: calculatePostPage(result.total, limit),
  };
};
```

### 2. Query factory for pagination[​](https://feature-sliced.design/docs/guides/tech/with-react-query.html#2-query-factory-for-pagination "Direct link to heading")

The `postQueries` query factory defines various query options for working with posts,
including requesting a list of posts with a specific page and limit.

```
import { keepPreviousData, queryOptions } from "@tanstack/react-query";
import { getPosts } from "./get-posts";

export const postQueries = {
  all: () => ["posts"],
  lists: () => [...postQueries.all(), "list"],
  list: (page: number, limit: number) =>
    queryOptions({
      queryKey: [...postQueries.lists(), page, limit],
      queryFn: () => getPosts(page, limit),
      placeholderData: keepPreviousData,
    }),
};
```

### 3. Use in application code[​](https://feature-sliced.design/docs/guides/tech/with-react-query.html#3-use-in-application-code "Direct link to heading")

@/pages/home/ui/index.tsx

```
export const HomePage = () => {
  const itemsOnScreen = DEFAULT_ITEMS_ON_SCREEN;
  const [page, setPage] = usePageParam(DEFAULT_PAGE);
  const { data, isFetching, isLoading } = useQuery(
    postApi.postQueries.list(page, itemsOnScreen),
  );
  return (
    <>
      <Pagination
        onChange={(_, page) => setPage(page)}
        page={page}
        count={data?.totalPages}
        variant="outlined"
        color="primary"
      />
      <Posts posts={data?.posts} />
    </>
  );
};
```

note

The example is simplified, the full version is available on [GitHub](https://github.com/ruslan4432013/fsd-react-query-example)

## `QueryProvider` for managing queries[​](https://feature-sliced.design/docs/guides/tech/with-react-query.html#queryprovider-for-managing-queries "Direct link to heading")

In this guide, we will look at how to organize a `QueryProvider`.

### 1. Creating a `QueryProvider`[​](https://feature-sliced.design/docs/guides/tech/with-react-query.html#1-creating-a-queryprovider "Direct link to heading")

The file `query-provider.tsx` is located at the path `@/app/providers/query-provider.tsx`.

@/app/providers/query-provider.tsx

```
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { ReactQueryDevtools } from "@tanstack/react-query-devtools";
import { ReactNode } from "react";

type Props = {
  children: ReactNode;
  client: QueryClient;
};

export const QueryProvider = ({ client, children }: Props) => {
  return (
    <QueryClientProvider client={client}>
      {children}
      <ReactQueryDevtools />
    </QueryClientProvider>
  );
};
```

### 2. Creating a `QueryClient`[​](https://feature-sliced.design/docs/guides/tech/with-react-query.html#2-creating-a-queryclient "Direct link to heading")

`QueryClient` is an instance used to manage API requests.
The `query-client.ts` file is located at `@/shared/api/query-client.ts`.
`QueryClient` is created with certain settings for query caching.

@/shared/api/query-client.ts

```
import { QueryClient } from "@tanstack/react-query";

export const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      staleTime: 5 * 60 * 1000,
      gcTime: 5 * 60 * 1000,
    },
  },
});
```

## Code generation[​](https://feature-sliced.design/docs/guides/tech/with-react-query.html#code-generation "Direct link to heading")

There are tools that can generate API code for you, but they are less flexible than the manual approach described above.
If your Swagger file is well-structured,
and you're using one of these tools, it might make sense to generate all the code in the `@/shared/api` directory.

## Additional advice for organizing RQ[​](https://feature-sliced.design/docs/guides/tech/with-react-query.html#additional-advice-for-organizing-rq "Direct link to heading")

### API Client[​](https://feature-sliced.design/docs/guides/tech/with-react-query.html#api-client "Direct link to heading")

Using a custom API client class in the shared layer,
you can standardize the configuration and work with the API in the project.
This allows you to manage logging,
headers and data exchange format (such as JSON or XML) from one place.
This approach makes it easier to maintain and develop the project because it simplifies changes and updates to interactions with the API.

@/shared/api/api-client.ts

```
import { API_URL } from "@/shared/config";

export class ApiClient {
  private baseUrl: string;

  constructor(url: string) {
    this.baseUrl = url;
  }

  async handleResponse<TResult>(response: Response): Promise<TResult> {
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }

    try {
      return await response.json();
    } catch (error) {
      throw new Error("Error parsing JSON response");
    }
  }

  public async get<TResult = unknown>(
    endpoint: string,
    queryParams?: Record<string, string | number>,
  ): Promise<TResult> {
    const url = new URL(endpoint, this.baseUrl);

    if (queryParams) {
      Object.entries(queryParams).forEach(([key, value]) => {
        url.searchParams.append(key, value.toString());
      });
    }
    const response = await fetch(url.toString(), {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });

    return this.handleResponse<TResult>(response);
  }

  public async post<TResult = unknown, TData = Record<string, unknown>>(
    endpoint: string,
    body: TData,
  ): Promise<TResult> {
    const response = await fetch(`${this.baseUrl}${endpoint}`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(body),
    });

    return this.handleResponse<TResult>(response);
  }
}

export const apiClient = new ApiClient(API_URL);
```

## See also[​](https://feature-sliced.design/docs/guides/tech/with-react-query.html#see-also "Direct link to heading")

* [(GitHub) Sample Project](https://github.com/ruslan4432013/fsd-react-query-example)
* [(CodeSandbox) Sample Project](https://codesandbox.io/p/github/ruslan4432013/fsd-react-query-example/main)
* [About the query factory](https://tkdodo.eu/blog/the-query-options-api)

[Previous

Usage with NuxtJS](https://feature-sliced.design/docs/guides/tech/with-nuxtjs)[Next

Usage with SvelteKit](https://feature-sliced.design/docs/guides/tech/with-sveltekit.html)

* [The problem of “where to put the keys”](https://feature-sliced.design/docs/guides/tech/with-react-query.html#the-problem-of-where-to-put-the-keys)
  + [Solution — break down by entities](https://feature-sliced.design/docs/guides/tech/with-react-query.html#solution--break-down-by-entities)+ [Alternative solution — keep it in shared](https://feature-sliced.design/docs/guides/tech/with-react-query.html#alternative-solution--keep-it-in-shared)* [The problem of “Where to insert mutations?”](https://feature-sliced.design/docs/guides/tech/with-react-query.html#the-problem-of-where-to-insert-mutations)
    + [1. Define a custom hook in the `api` segment near the place of use](https://feature-sliced.design/docs/guides/tech/with-react-query.html#1-define-a-custom-hook-in-the-api-segment-near-the-place-of-use)+ [2. Define a mutation function somewhere else (Shared or Entities) and use `useMutation` directly in the component](https://feature-sliced.design/docs/guides/tech/with-react-query.html#2-define-a-mutation-function-somewhere-else-shared-or-entities-and-use-usemutation-directly-in-the-component)* [Organization of requests](https://feature-sliced.design/docs/guides/tech/with-react-query.html#organization-of-requests)
      + [Query factory](https://feature-sliced.design/docs/guides/tech/with-react-query.html#query-factory)+ [1. Creating a Query Factory](https://feature-sliced.design/docs/guides/tech/with-react-query.html#1-creating-a-query-factory)+ [2. Using Query Factory in application code](https://feature-sliced.design/docs/guides/tech/with-react-query.html#2-using-query-factory-in-application-code)+ [Benefits of using a Query Factory](https://feature-sliced.design/docs/guides/tech/with-react-query.html#benefits-of-using-a-query-factory)* [Pagination](https://feature-sliced.design/docs/guides/tech/with-react-query.html#pagination)
        + [1. Creating a function `getPosts`](https://feature-sliced.design/docs/guides/tech/with-react-query.html#1-creating-a-function-getposts)+ [2. Query factory for pagination](https://feature-sliced.design/docs/guides/tech/with-react-query.html#2-query-factory-for-pagination)+ [3. Use in application code](https://feature-sliced.design/docs/guides/tech/with-react-query.html#3-use-in-application-code)* [`QueryProvider` for managing queries](https://feature-sliced.design/docs/guides/tech/with-react-query.html#queryprovider-for-managing-queries)
          + [1. Creating a `QueryProvider`](https://feature-sliced.design/docs/guides/tech/with-react-query.html#1-creating-a-queryprovider)+ [2. Creating a `QueryClient`](https://feature-sliced.design/docs/guides/tech/with-react-query.html#2-creating-a-queryclient)* [Code generation](https://feature-sliced.design/docs/guides/tech/with-react-query.html#code-generation)* [Additional advice for organizing RQ](https://feature-sliced.design/docs/guides/tech/with-react-query.html#additional-advice-for-organizing-rq)
              + [API Client](https://feature-sliced.design/docs/guides/tech/with-react-query.html#api-client)* [See also](https://feature-sliced.design/docs/guides/tech/with-react-query.html#see-also)
