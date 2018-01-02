library(shiny)
library(shinythemes)
library(mc2d)
library(scales)
library(ggplot2)



ui <- fluidPage(
  
  titlePanel("CALCYUM"),
  
  wellPanel(
    wellPanel(
      fluidRow(
        column(width = 3,
               numericInput("seed", label = h5("Seed"), value = 1)
        ),
        column(width = 3,   
               numericInput("iterations", label = h5("Iterations"), value = 500, step = 1000)
        )
      )
    ),
    
    fluidRow(
      
      column(2,
             p("Factor"),
             textInput("1", value = "Loss Event Frequency", label = NULL),
             textInput("2", value = "Revenue Generated (per hour)", label = NULL),
             textInput("3", value = "Hours Affected", label = NULL),
             textInput("4", value = "Legal Inveestigation", label = NULL),
             textInput("5", value = "Technical Response", label = NULL),
             textInput("6", value = "Replacement", label = NULL),
             textInput("7", value = "Legal Defense", label = NULL),
             textInput("8", value = "(sec)Hours Affected", label = NULL),
             textInput("9", value = "Technical Response", label = NULL),
             textInput("10", value = "Customers Notified", label = NULL),
             textInput("11", value = "Notification Cost (per)", label = NULL),
             textInput("12", value = "Customers Protected", label = NULL),
             textInput("13", value = "Protection Cost (per)", label = NULL),
             textInput("14", value = "Response", label = NULL),
             textInput("15", value = "Replacement", label = NULL),
             textInput("16", value = "Projected Revenue", label = NULL),
             textInput("17", value = "Percent Reduction", label = NULL),
             textInput("18", value = "Company Value", label = NULL),
             textInput("19", value = "Percent Drop in Share", label = NULL),
             textInput("20", value = "Regulatory Fines", label = NULL),
             textInput("21", value = "Judgments and Settlements", label = NULL),
             textInput("22", value = "Contractual Penalties", label = NULL),
             textInput("23", value = "PCI Fines", label = NULL)
             
      ),
      column(2,
             p("Minimum"),
             numericInput("LEF_min", label = NULL, value = 0.1),
             numericInput("rev_gen_min", label = NULL, value = 0),
             numericInput("hours_aff_min", label = NULL, value = 0),
             numericInput("prim_legal_min", label = NULL, value = 10000),
             numericInput("prim_tech_min", label = NULL, value = 0),
             numericInput("prim_repl_min", label = NULL, value = 0),
             numericInput("sec_leg_min", label = NULL, value = 0),
             numericInput("sec_hours_aff_min", label = NULL, value = 0),
             numericInput("sec_tech_min", label = NULL, value = 0),
             numericInput("sec_cust_nt_min", label = NULL, value = 0),
             numericInput("sec_nt_cost_min", label = NULL, value = 0),
             numericInput("sec_cust_pro_min", label = NULL, value = 0),
             numericInput("sec_pro_cost_min", label = NULL, value = 0),
             numericInput("sec_resp_min", label = NULL, value = 0),
             numericInput("sec_repl_min", label = NULL, value = 0),
             numericInput("sec_proj_rev_min", label = NULL, value = 0),
             numericInput("sec_per_red_min", label = NULL, value = 0),
             numericInput("sec_val_min", label = NULL, value = 0),
             numericInput("sec_drop_min", label = NULL, value = 0),
             numericInput("sec_reg_min", label = NULL, value = 0),
             numericInput("sec_settle_min", label = NULL, value = 0),
             numericInput("sec_pen_min", label = NULL, value = 0),
             numericInput("sec_PCI_min", label = NULL, value = 0)
             
             
      ),
      column(2,
             p("Most Likely"),
             numericInput("LEF_ml", label = NULL, value = 1),
             numericInput("rev_gen_ml", label = NULL, value = 0),
             numericInput("hours_aff_ml", label = NULL, value = 0),
             numericInput("prim_legal_ml", label = NULL, value = 25000),
             numericInput("prim_tech_ml", label = NULL, value = 0),
             numericInput("prim_repl_ml", label = NULL, value = 0),
             numericInput("sec_leg_ml", label = NULL, value = 0),
             numericInput("sec_hours_aff_ml", label = NULL, value = 0),
             numericInput("sec_tech_ml", label = NULL, value = 0),
             numericInput("sec_cust_nt_ml", label = NULL, value = 0),
             numericInput("sec_nt_cost_ml", label = NULL, value = 0),
             numericInput("sec_cust_pro_ml", label = NULL, value = 0),
             numericInput("sec_pro_cost_ml", label = NULL, value = 0),
             numericInput("sec_resp_ml", label = NULL, value = 0),
             numericInput("sec_repl_ml", label = NULL, value = 0),
             numericInput("sec_proj_rev_ml", label = NULL, value = 0),
             numericInput("sec_per_red_ml", label = NULL, value = 0),
             numericInput("sec_val_ml", label = NULL, value = 0),
             numericInput("sec_drop_ml", label = NULL, value = 0),
             numericInput("sec_reg_ml", label = NULL, value = 0),
             numericInput("sec_settle_ml", label = NULL, value = 0),
             numericInput("sec_pen_ml", label = NULL, value = 0),
             numericInput("sec_PCI_ml", label = NULL, value = 0)
      ),
      column(2,
             p("Maximum"),
             numericInput("LEF_max",  label = NULL, value = 12),
             numericInput("rev_gen_max", label = NULL, value = 0),
             numericInput("hours_aff_max", label = NULL, value = 0),
             numericInput("prim_legal_max", label = NULL, value = 150000),
             numericInput("prim_tech_max", label = NULL, value = 0),
             numericInput("prim_repl_max", label = NULL, value = 0),
             numericInput("sec_leg_max", label = NULL, value = 0),
             numericInput("sec_hours_aff_max", label = NULL, value = 0),
             numericInput("sec_tech_max", label = NULL, value = 0),
             numericInput("sec_cust_nt_max", label = NULL, value = 0),
             numericInput("sec_nt_cost_max", label = NULL, value = 0),
             numericInput("sec_cust_pro_max", label = NULL, value = 0),
             numericInput("sec_pro_cost_max", label = NULL, value = 0),
             numericInput("sec_resp_max", label = NULL, value = 0),
             numericInput("sec_repl_max", label = NULL, value = 0),
             numericInput("sec_proj_rev_max", label = NULL, value = 0),
             numericInput("sec_per_red_max", label = NULL, value = 0),
             numericInput("sec_val_max", label = NULL, value = 0),
             numericInput("sec_drop_max", label = NULL, value = 0),
             numericInput("sec_reg_max", label = NULL, value = 0),
             numericInput("sec_settle_max", label = NULL, value = 0),
             numericInput("sec_pen_max", label = NULL, value = 0),
             numericInput("sec_PCI_max", label = NULL, value = 0)
      ),
      column(2,
             p("Confidence"),
             numericInput("LEF_conf",  label = NULL, value = 4),
             numericInput("rev_gen_conf", label = NULL, value = 4),
             numericInput("hours_aff_conf", label = NULL, value = 4),
             numericInput("prim_legal_conf", label = NULL, value = 4),
             numericInput("prim_tech_conf", label = NULL, value = 4),
             numericInput("prim_repl_conf", label = NULL, value = 4),
             numericInput("sec_leg_conf", label = NULL, value = 4),
             numericInput("sec_hours_aff_conf", label = NULL, value = 4),
             numericInput("sec_tech_conf", label = NULL, value = 4),
             numericInput("sec_cust_nt_conf", label = NULL, value = 4),
             numericInput("sec_nt_cost_conf", label = NULL, value = 4),
             numericInput("sec_cust_pro_conf", label = NULL, value = 4),
             numericInput("sec_pro_cost_conf", label = NULL, value = 4),
             numericInput("sec_resp_conf", label = NULL, value = 4),
             numericInput("sec_repl_conf", label = NULL, value = 4),
             numericInput("sec_proj_rev_conf", label = NULL, value = 4),
             numericInput("sec_per_red_conf", label = NULL, value = 4),
             numericInput("sec_val_conf", label = NULL, value = 4),
             numericInput("sec_drop_conf", label = NULL, value = 4),
             numericInput("sec_reg_conf", label = NULL, value = 4),
             numericInput("sec_settle_conf", label = NULL, value = 4),
             numericInput("sec_pen_conf", label = NULL, value = 4),
             numericInput("sec_PCI_conf", label = NULL, value = 4)
      ),
      column(2,
             p("SLEF%"),
             textInput("LEF_SLEF",  label = NULL, value = 0),
             textInput("rev_gen_SLEF", label = NULL, value = 0),
             textInput("hours_aff_SLEF", label = NULL, value = 0),
             textInput("prim_legal_SLEF", label = NULL, value = 0),
             textInput("prim_tech_SLEF", label = NULL, value = 0),
             textInput("prim_repl_SLEF", label = NULL, value = 0),
             numericInput("sec_leg_SLEF", label = NULL, value = 100, step = 10),
             numericInput("sec_hours_aff_SLEF", label = NULL, value = 100, step = 10),
             numericInput("sec_tech_SLEF", label = NULL, value = 100, step = 10),
             numericInput("sec_cust_nt_SLEF", label = NULL, value = 100, step = 10),
             numericInput("sec_nt_cost_SLEF", label = NULL, value = 100, step = 10),
             numericInput("sec_cust_pro_SLEF", label = NULL, value = 100, step = 10),
             numericInput("sec_pro_cost_SLEF", label = NULL, value = 100, step = 10),
             numericInput("sec_resp_SLEF", label = NULL, value = 100, step = 10),
             numericInput("sec_repl_SLEF", label = NULL, value = 100, step = 10),
             numericInput("sec_proj_rev_SLEF", label = NULL, value = 100, step = 10),
             numericInput("sec_rep_red_SLEF", label = NULL, value = 100, step = 10),
             numericInput("sec_val_SLEF", label = NULL, value = 100, step = 10),
             numericInput("sec_drop_SLEF", label = NULL, value = 100, step = 10),
             numericInput("sec_reg_SLEF", label = NULL, value = 100, step = 10),
             numericInput("sec_settle_SLEF", label = NULL, value = 100, step = 10),
             numericInput("sec_pen_SLEF", label = NULL, value = 100, step = 10),
             numericInput("sec_PCI_SLEF", label = NULL, value = 100, step = 10)
      )
    ),
    
    wellPanel(
      verbatimTextOutput("summary"),
      splitLayout( 
        plotOutput("plot"),
        plotOutput("plot2")
      )
    )
  )
)

server <- function(input, output) {
  
  LEF <-          reactive({rpert(input$iterations, min = input$LEF_min, mode = input$LEF_ml, max = input$LEF_max, shape = input$LEF_conf)})
  rev_gen <-      reactive({rpert(input$iterations, min = input$rev_gen_min, mode = input$rev_gen_ml, max = input$rev_gen_max, shape = input$rev_gen_conf)})
  hours_aff <-    reactive({rpert(input$iterations, min = input$hours_aff_min, mode = input$hours_aff_ml, max = input$hours_aff_max, shape = input$hours_aff_conf)})
  prim_legal <-   reactive({rpert(input$iterations, min = input$prim_legal_min, mode = input$prim_legal_ml, max = input$prim_legal_max, shape = input$prim_legal_conf)})
  prim_tech <-    reactive({rpert(input$iterations, min = input$prim_tech_min, mode = input$prim_tech_ml, max = input$prim_tech_max, shape = input$prim_tech_conf)})
  prim_repl <-    reactive({rpert(input$iterations, min = input$prim_repl_min, mode = input$prim_repl_ml, max = input$prim_repl_max, shape = input$prim_repl_conf)})
  sec_leg <-      reactive({rpert(input$iterations, min = input$sec_leg_min, mode = input$sec_leg_ml, max = input$sec_leg_max, shape = input$sec_leg_conf)})
  sec_hours_aff <-reactive({rpert(input$iterations, min = input$sec_hours_aff_min, mode = input$sec_hours_aff_ml, max = input$sec_hours_aff_max, shape = input$sec_hours_aff_conf)})
  sec_tech <-     reactive({rpert(input$iterations, min = input$sec_tech_min, mode = input$sec_tech_ml, max = input$sec_tech_max, shape = input$sec_tech_conf)})
  sec_cust_nt <-  reactive({rpert(input$iterations, min = input$sec_cust_nt_min, mode = input$sec_cust_nt_ml, max = input$sec_cust_nt_max, shape = input$sec_cust_nt_conf)})
  sec_nt_cost <-  reactive({rpert(input$iterations, min = input$sec_nt_cost_min, mode = input$sec_nt_cost_ml, max = input$sec_nt_cost_max, shape = input$sec_nt_cost_conf)})
  sec_cust_pro <- reactive({rpert(input$iterations, min = input$sec_cust_pro_min, mode = input$sec_cust_pro_ml, max = input$sec_cust_pro_max, shape = input$sec_cust_pro_conf)})
  sec_pro_cost <- reactive({rpert(input$iterations, min = input$sec_pro_cost_min, mode = input$sec_pro_cost_ml, max = input$sec_pro_cost_max, shape = input$sec_pro_cost_conf)})
  sec_resp <-     reactive({rpert(input$iterations, min = input$sec_resp_min, mode = input$sec_resp_ml, max = input$sec_resp_max, shape = input$sec_resp_conf)})
  sec_repl <-     reactive({rpert(input$iterations, min = input$sec_repl_min, mode = input$sec_repl_ml, max = input$sec_repl_max, shape = input$sec_repl_conf)})
  sec_proj_rev <- reactive({rpert(input$iterations, min = input$sec_proj_rev_min, mode = input$sec_proj_rev_ml, max = input$sec_proj_rev_max, shape = input$sec_proj_rev_conf)})
  sec_per_red <-  reactive({rpert(input$iterations, min = input$sec_per_red_min, mode = input$sec_per_red_ml, max = input$sec_per_red_max, shape = input$sec_per_red_conf)})
  sec_val <-      reactive({rpert(input$iterations, min = input$sec_val_min, mode = input$sec_val_ml, max = input$sec_val_max, shape = input$sec_val_conf)})
  sec_drop <-     reactive({rpert(input$iterations, min = input$sec_drop_min, mode = input$sec_drop_ml, max = input$sec_drop_max, shape = input$sec_drop_conf)})
  sec_reg <-      reactive({rpert(input$iterations, min = input$sec_reg_min, mode = input$sec_reg_ml, max = input$sec_reg_max, shape = input$sec_reg_conf)})
  sec_settle <-   reactive({rpert(input$iterations, min = input$sec_settle_min, mode = input$sec_settle_ml, max = input$sec_settle_max, shape = input$sec_settle_conf)})
  sec_pen <-      reactive({rpert(input$iterations, min = input$sec_pen_min, mode = input$sec_pen_ml, max = input$sec_pen_max, shape = input$sec_pen_conf)})
  sec_PCI <-      reactive({rpert(input$iterations, min = input$sec_PCI_min, mode = input$sec_PCI_ml, max = input$sec_PCI_max, shape = input$sec_PCI_conf)})
  
  slPlus <-     reactive({sec_leg()+sec_tech()+sec_resp()+sec_repl()+sec_reg()+sec_settle()+sec_pen()+sec_PCI()})
  slMult <-     reactive({(rev_gen()*sec_hours_aff())+(sec_cust_nt()*sec_nt_cost())+(sec_cust_pro()*sec_pro_cost())+(sec_proj_rev()*sec_per_red())+(sec_val()*sec_drop())})
  sr <-         reactive({slPlus()*slMult()})
  plm <-        reactive({((rev_gen()*hours_aff())+prim_legal()+prim_tech()+prim_repl())})
  risk <-       reactive({(LEF()*plm())+sr()})
  
  output$summary <- renderPrint({summary(risk())})
  output$plot <-    renderPlot({plot(plm(), xlab = "Simulations", ylab = "Loss", main = "Loss Simulations")})
  output$plot2 <-   renderPlot({hist(risk(), xlab = "Risk", ylab = "Simulations", main = "Risk Simulations")})}

shinyApp(ui = ui, server = server)


