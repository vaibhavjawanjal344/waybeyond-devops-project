# Use Windows base for Windows Docker
FROM mcr.microsoft.com/windows/nanoserver:ltsc2022

# Or if using Linux containers, try this:
# FROM scratch
# ADD https://github.com/nodejs/node/archive/refs/tags/v18.17.0.tar.gz /node.tar.gz