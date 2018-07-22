# docker-slimerjs-firefox
Build a Docker image from the latest slimerjs and firefox running on top of Alpine Linux.
Ready-to-use images are available from: https://hub.docker.com/r/hzgl/slimerjs/

Keep in mind that the Dockerfile uses Alpine Linux edge repository, which constantly
receives bleeding edge packages, and SlimerJS as of version 1.0.0 cannot work with Firefox
version newer than 59.

# Version history
Tag 20180520: SlimerJS 1.0.0, Firefox 58.0.1
