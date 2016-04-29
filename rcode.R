library(conduit)

### Module and pipeline result objects
mod1 <- loadModule(name = "mod1",
                  ref = system.file("extdata", "test_pipeline", "module1.xml",
                                     package = "conduit"))
modRes1 <- runModule(mod1)
class(modRes1)

modExport1 <- export(modRes1)
basename(modExport1)

system2("tar", c("-tf", modExport1))

recoveredMod1 <- importModule(tarfile = modExport1, name = "recoveredMod1")
class(recoveredMod1)

pipeline1 <- loadPipeline(
    name = "pipeline1",
    ref = system.file("extdata", "test_pipeline", "pipeline.xml",
                      package = "conduit"))
pipelineRes1 <- runPipeline(pipeline1)
class(pipelineRes1)

pplExport1 <- export(pipelineRes1)
basename(pplExport1)

system2("tar", c("-tf", pplExport1))

recoveredPpl1 <- importPipeline(tarfile = pplExport1, name = "recoveredPpl1")
class(recoveredPpl1)
