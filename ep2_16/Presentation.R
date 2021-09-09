
# install.packages(c("remotes","here"))
# remotes::install_github("thebioengineer/sidescroller")
# remotes::install_github("gadenbuie/xaringanExtra")
library(sidescroller)
library(here)
library(xaringanExtra)


pres <- sidescroller(
  list(
    htmltools::htmlDependency(
      name = "darker-grotesque",
      version = "1.0",
      src = c(href = "https://fonts.googleapis.com/css?family=Darker+Grotesque&display=swap"),
      stylesheet = ""),
    htmltools::htmlDependency(
      name = "fontts",
      version = "1.0",
      src = c(href = "https://fonts.googleapis.com/css2?family=Gruppo&display=swap"),
      stylesheet = ""),
    htmltools::htmlDependency(
      name = "font-awesome",
      version = "4.7.0",
      src = c(href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/"),
      stylesheet = "font-awesome.min.css"),
    htmltools::htmlDependency(
      name = "RStudio_pres",
      version = "1.0",
      src = c(href = "www"),
      script = c("useR_conf_2021.js","prism.js"),
      stylesheet = c("useR_conf_2021.css","prism.css")),
    html_dependency_webcam(width = 300, height = 300)
    ))

## Title ----
pres_title <- pres %>% 
  title_slide(
    title = tags$div(style = "font-weight:200;font-size:100px","R Package Validation and {valtools}"),
    subtitle = 
      list(HTML("<p class='subtitle_text' style = 'font-size: 70px;margin-bottom: -50px;padding-bottom: 75px;'>Ellis Hughes</p>",
           "<p class='subtitle_text'>",
           "<i href = 'https://twitter.com/ellis_hughes' style = 'text-decoration: none; color: white' class='fa fa-twitter'></i> @ellis_hughes",
           "</p>",
           "<p class='subtitle_text'>",
           "<i href = 'https://github.com/thebioengineer' style = 'text-decoration: none; color: white' class='fa fa-github'></i> thebioengineer",
           "</p>"))
    ,
    style = "font-family: 'Darker Grotesque',Arial;
    font-size: 40px;
    font-weight: 300;
    background-image: url(img/title_background.jpg);
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center top;"
  )

# ## Bio ----
pres_bio <- pres_title %>%
  slide_markdown(title = tags$div(style = 'width:1000px',"Ellis Hughes"),"
      <div style = 'height:100%'>
        <div style = 'display:inline-block; vertical-align: top; padding-right:20px; font-size: 45px;margin-left: 50px;'>
        - <span style='font-weight: bold;'>Statistical Programmer</span>
        <br>
        - <span style='font-weight: bold;'>Community</span>
          - Seattle UseR Organizer
          - Cascadia R Conf Chair
          - R/Pharma Conference 
          - TidyX Screencast
        </div>
        <div style = 'display:inline-block;height:inherit;'>
         <img src = 'https://thebioengineer.github.io/images/r_in_pharma/img/ellis_hughes.jpg' style = '-webkit-transform: rotate(90deg);
                 -moz-transform: rotate(90deg);
                 -o-transform: rotate(90deg);
                 -ms-transform: rotate(90deg);
                 transform: rotate(90deg);
                 height: 350px;
                 margin: 100px;'/>
        </div>
      </div>", style = "margin-top:50px")

### Defining Validation ----

## Validation ----
pres_val_elements <- pres_bio %>%
  slide_multipanel(
    title = tags$div(style = 'width:800px', "R Package Validation Framework"),
    
    panel(div(
      class = "center_content", div(
        style = "margin: auto; height: 130%;",
        img(src = "img/Framework.png",
            style = "width: 1500px;height: auto; margin-top: 200px;",
            alt = "Image of the R Package Validation Framework where there are 5 steps listed sequentially - 
            Requirements, R Package Development, Test Cases, Test Code, and Validation Report.
            Below each step there is a description:
            Requirements - Record the Expectations, goals, and risk of the project
            R Package Development - Implementation of requirements into R package
            Test Cases - Describes how code meets specifications
            Test Code - Implementation of test cases in code
            Validation Report - Combine all prior content into report documenting proof that code meets specifications.
            "
            ),
      )
    )),
    
    panel_markdown("
  <h3>{valtools} R Package</h3>

    - v0.3.0
    
    - github.com/phuse-org/valtools

    - Provide tooling extending {usethis} & {devtools} for validation

  ",
      style = "font-size: 45px;margin-top: 140px;"
    ),
    
    panel(div(
      class = "center_content",
      div(
        style = "margin: auto; height: 130%;",
        img(
          src = "img/push-button-get-validation-rocket.PNG.jpg",
          style = "width: 1500px;height: auto; margin-top: 100px;",
          alt = "Image of a rocket taking off from a launch pad with two red boxes side by side across the middle with white text -
          Push Button in the left box, Get Validated in the right box"
          ),
      )
    ))
  )


pres_val_init <- pres_val_elements %>%
  slide_multipanel(
    title = tags$div(style = 'width:700px', "Initializing"),
    
    panel_markdown(
      "
      Adding validation infrastructure to a package

      ```{r, eval = FALSE}
      valtools::vt_use_validation() # Existing projects/packages
      ```
      
      - 
      
      
      Creates package with validation infrastructure
      
      ```{r, eval = FALSE}
      valtools::vt_create_package(\"hello.world\")
      ```

      ",
      style = "font-size: 45px; margin-top: 140px;font-size: 50px"
    ))

## Elements ----
pres_val_elements <- pres_val_init %>% 
  slide_multipanel(title = tags$div(style = 'width:700px',"Validation Elements"),
                   
  panel_markdown("
      
  ```r
  valtools::vt_use_req(\"requirement_001\")
  valtools::vt_use_test_case(\"test_case_001\")
  valtools::vt_use_test_code(\"test_code_001\")
  ```
  - Creates file
  - Asks for user information (if necessary)
  - Opens for editing
  - Comes with Roxygen tags pre-populated
  - 
  - analogs to usethis::use_*
      
  ", style = "font-size: 45px; margin-top: 140px;font-size: 50px")

  )


## Roxygen Tags ----
pres_val_roxy <- pres_val_elements %>% 
  
  slide_multipanel(title = tags$div(style = 'width:1000px',"Custom Roxygen Tags"),
                
  panel_markdown("
  
  <span style='color:indianred;'>@editor</span> who did it
  
  <span style='color:indianred;'>@editDate</span> when they did it
  
  <span style='color:indianred;'>@riskAssessment</span> Risk of Requirements
  
  <span style='color:indianred;'>@coverage</span> Which Requirements are covered
  
  <span style='color:indianred;'>@deprecate</span> Which element is deprecated
    
  ", style = "margin-top: 140px; font-size: 45px;"),
  
  panel(div(div(markdown_to_html("
  
  ```{r eval = FALSE, echo = TRUE}
  #' Hello World
  #' @param name name to say hello to
  #' @returns character string saying hello
  #' @editor Ellis Hughes
  #' @editDate 2021-03-12
  #' @export
  hello_world <- function(name){
    paste(\"Hello,\",name)
  }
  ```
  "), style = "margin:auto"),  class = "center_content"), style = "font-size: 50px;")
  )

## Report Elements ----

pres_val_rep_el <- pres_val_roxy %>% 
  slide_multipanel(title = tags$div(style = 'width:600px',"Report Authoring"),
  
  panel_markdown("
      
  ```r
  valtools::vt_use_report()
  
  ```
  - Creates report file
  - Comes with report contents
  - {valtools} provides helper functions for scraping <br>and generating your report

  ", style = "font-size: 45px; margin-top: 140px;font-size: 50px"))

## Validation ----

pres_val_run <- pres_val_rep_el %>% 
  slide_multipanel(title = tags$div(style = 'width:1000px',"Validation Modes"),

  panel_markdown("
  Evaluate the report to validate package
  
  ```r
  valtools::vt_validate_report()
  valtools::vt_validate_source()
  valtools::vt_validate_build()
  valtools::vt_validate_install()
  valtools::vt_validate_installed_package()
  ```
  - -runs (and may temporarily install package) validation report
  - -saves output to output directory
  - -opens output report
  
  ", style = "font-size: 45px; margin-top: 140px;font-size: 50px")
  

  )

## End ----

pres_forever <- pres_val_run %>% 
  slide_wide(title = NULL,
             tags$div(
               tags$img(
                 src = "img/val_and_R_forever2.png", 
                 style = "height:100%; margin:auto;",
                 alt = "Image with the words: Validation plus R forever, with a heart written around them"
            ), 
  class = "center_content", style = "height: 110%"))   
                   
pres_final <- pres_forever %>%  
  slide_markdown( title = tags$div(style = 'width:1600px; font-size: 120px',"Thank You"),"
  
   <div style = 'margin:auto;padding-top:20px;text-align:left; z-index:21; position: relative;'>
   <br>
   <div style = 'background-color: #ffffff;opacity: .5;border-radius: 10px;width: 1200px;padding: 20px;font-size: 60px;margin:auto;color: black;'>
    <br>
    <p style = 'margin-bottom: 0;'><i style = 'text-decoration: none;' class='fa fa-github-square'></i> github.com/thebioengineer/validation_useR_2021</p>
    <p style = 'margin-bottom: 0;'><i style = 'text-decoration: none;' class='fa fa-github-square'></i> github.com/phuse-org/valtools</p>
    </div>
    </div>
   </div>
   <p style = 'margin-bottom: 0;'> Presentation brought to you by {sidescroller} </p>
   
   ", style = "text-align: center;width:1600px; margin-top: 50px;")

## Save Presentation ----

save_sidescroller(pres_final,
                  here("index.html"))

file.show(here("index.html"))
