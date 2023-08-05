# This file has been generated by the Catala compiler, do not edit!

source("runtimes/r/runtime.R")

catala_struct_S <- setRefClass("catala_struct_S",
  fields = list(
    a = "catala_integer", b = "logical",
    c = "list" # array("catala_decimal")
  )
)

catala_struct_Foo <- setRefClass("catala_struct_Foo",
  fields = list(z = "logical")
)

# Enum cases: "Case1" ("catala_struct_S"), "Case2" ("catala_unit")
catala_enum_E <- setRefClass("catala_enum_E",
  fields = list(code = "character", value = "ANY")
)

catala_struct_FooIn <- setRefClass("catala_struct_FooIn",
  fields = list(x_in = "catala_integer")
)



foo <- function(
    foo_in # ("catala_struct_FooIn")
    ) {
  x <- foo_in$x_in
  tryCatch(
    {
      temp_y <- function(dummy_var # ("catala_unit")
      ) {
        return(catala_enum_E(
          code = "Case2",
          value = catala_unit(v = 0)
        ))
      }
      temp_y_1 <- function(dummy_var # ("catala_unit")
      ) {
        return(TRUE)
      }
      temp_y_2 <- function(dummy_var # ("catala_unit")
      ) {
        temp_y_3 <- function(dummy_var # ("catala_unit")
        ) {
          return(catala_enum_E(
            code = "Case1",
            value = catala_struct_S(
              a = catala_integer_from_numeric(1),
              b = TRUE, c = list(
                catala_decimal_from_string("0.2"),
                catala_decimal_from_string("0.3")
              )
            )
          ))
        }
        temp_y_4 <- function(dummy_var # ("catala_unit")
        ) {
          return((x == catala_integer_from_numeric(1)))
        }
        return(handle_default(
          catala_position(
            filename = "",
            start_line = 0, start_column = 1,
            end_line = 0, end_column = 1,
            law_headings = c()
          ), list(), temp_y_4,
          temp_y_3
        ))
      }
      temp_y_5 <- handle_default(
        catala_position(
          filename = "",
          start_line = 0, start_column = 1,
          end_line = 0, end_column = 1,
          law_headings = c()
        ), list(temp_y_2),
        temp_y_1, temp_y
      )
    },
    catala_empty_error = function(dummy__arg) {
      temp_y_5 <- dead_value
      stop(catala_no_value_provided_error(
        catala_position(
          filename = "test.catala_en",
          start_line = 17,
          start_column = 12,
          end_line = 17,
          end_column = 13,
          law_headings = c(
            "Coucou",
            "Salut"
          )
        )
      ))
    }
  )
  y <- temp_y_5
  tryCatch(
    {
      temp_z <- function(dummy_var # ("catala_unit")
      ) {
        match_arg <- y
        if (match_arg$code == "Case1") {
          dummy_var <- match_arg$value
          return(TRUE)
        } else if (match_arg$code == "Case2") {
          dummy_var <- match_arg$value
          return(FALSE)
        }
      }
      temp_z_1 <- function(dummy_var # ("catala_unit")
      ) {
        return(TRUE)
      }
      temp_z_2 <- handle_default(
        catala_position(
          filename = "",
          start_line = 0, start_column = 1,
          end_line = 0, end_column = 1,
          law_headings = c()
        ), list(), temp_z_1,
        temp_z
      )
    },
    catala_empty_error = function(dummy__arg) {
      temp_z_2 <- dead_value
      stop(catala_no_value_provided_error(
        catala_position(
          filename = "test.catala_en",
          start_line = 18,
          start_column = 10,
          end_line = 18,
          end_column = 11,
          law_headings = c(
            "Coucou",
            "Salut"
          )
        )
      ))
    }
  )
  z <- temp_z_2
  return(catala_struct_Foo(z = z))
}
