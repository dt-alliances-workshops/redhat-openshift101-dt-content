# Overview

This repo contains the content for the `Openshift 4 101 w/Dynatrace` workshop available at http://redhat-openshift101-dt-workshop.alliances.dynatracelabs.com/

# Feedback

Whether it's a bug report, new feature, correction, or additional documentation, we greatly value feedback and contributions.

You can share your feedback by opening a new issue [here](https://github.com/change/issues).

Please ensure we have all the necessary information to effectively respond to your bug report or contribution such as:
* The URL to the page, file or script with an issue
* A reproducible test case or series of steps

# Content generation

The generator runs via vanilla node:
```node bin/generator.js```

and then you can serve it locally:
```node bin/server.js```

## Formatting
### Folder structure
All activities are organized in folders, each containing their own index.md. Activities support 1 set of sub activities if needed. Navigation is created automatically using the order that each folder comes in.
- 01_activity_one
  - index.md
- 02_activity_two
  - 01_subactivity_one
    - index.md
  - index.md
- 03_activity_three
  - index.md
### Headers
Each activity needs to have a **Heading 2** as the first line of the index.md. This will be used for the table of contents and navigation. From there, **Heading 3** and **Heading 4** paragraph styles can be used to organize your content.
### Images
All images can be included in the `assets/images` folder. When the lab guide is generated and applied, the Dynatrace Alliance team will host the content via CDN on the specified URL.


# Maintainer

[Michael Villiger](https://www.linkedin.com/in/michaelvilliger/) -- Email me @ michael.villiger@dynatrace.com with questions or more details.