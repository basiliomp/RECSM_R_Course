library(webshot)

for (i in 1:4) { # Looping over folders for saving list of slides to convert.
  if (Sys.info()[[1]] == "Windows") { # Paths differ depending on OS in use.
    file_name <-
      normalizePath(
        paste0("RECSM_R_Course/class_", i,"/Slides/slides.html")
      )
  } else {
    file_name <-
      paste0(
        "file://",
        normalizePath(
          paste0("repositories/RECSM_R_Course/class_", i,"/Slides/slides.html")
        )
      )
  }
  # Proceeding to capture pdf export of slides
  webshot(
    file_name,
    paste0("RECSM_R_Course/class_", i,"/Slides/slides_", i, ".pdf")
  )
}
