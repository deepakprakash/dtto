# dtto

dtto (from ditto) is a very simple, self-hosted [go/links](https://www.linkedin.com/pulse/what-go-links-heres-everything-you-need-know-golinks/) implementation with a Directus backend.

## How does it work?
You create a Directus project and a collection with a specific schema. Then run the dtto service with configuration to use this collection as the data layer.

Whenever you try to access a go/link, it will query Directus and redirect if it finds it.

To add or edit links, you use the Directus UI. Use its built-in permissions for access control within your team or org.

## Running Locally
Refer readme under the dtto directory
