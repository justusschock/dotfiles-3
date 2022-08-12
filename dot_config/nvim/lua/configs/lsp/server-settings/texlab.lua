return {
  settings = {
    texlab = {
      build = {
        executable = "docker run --ipc=host --rm -i -v $(PWD):/workdir -u $(id -u ${USER}):$(id -g ${USER}) justusschock/latex:stable latexmk",
        args = {"-pdf",  "-synctex=1", "-interaction=nonstopmode","-shell-escape", "-use-make", "-cd", "-time", "-verbose", "%f"},
      },
      forwardSearch = {
        executable = "/Applications/Skim.app/Contents/SharedSupport/displayline",
        args = {"%l", "%p", "%f"}
      }
    },
  },
} 
