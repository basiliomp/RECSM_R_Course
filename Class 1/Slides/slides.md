<style>
bold {font-weight: bold; }

.section .reveal .state-background {
    background: white;
}

.section .reveal p {
   color: black;
   text-align:center;
   font-size: 1.8em;
}

.section .reveal h1,
.section .reveal h2 {
    color: black;
    text-align:center;
    width:100%;
}


</style>

An introduction to R
========================================================
author: Jorge Cimentada and Basilio Moreno
date:  23rd of June of 2017
class: section
font-family: 'Helvetica'
width: 1800
height: 900

<!-- Arreglar que las imagenes que se vean -->
<div align="left">
<img src="./figures/rlogo.png" width=500 height=350>
</div>

<div align="right">
<img src="./figures/rstudiologo.png" width=500 height=350>
</div>

How to install R?
========================================================

Luckily, you guys have R and Rstudio installed, so you don't have to worry about this!

But if you want to install it at home, please follow [this guide](https://github.com/cimentadaj/Rseminars/blob/master/RonR_Second_Seminar/README.md)

That guide can help you install

* R
* Rstudio
* And `swirl`, a package in which you will do a bunch of exercises as homework!

What is R?
========================================================

R is a programming language designed to do data analysis, usually interactive.

R is helpful for..

* Getting that darn excel/stata file into R (importing)
* Turning that very ugly dataset into something to work with (data cleaning)
* Automating your weekly reports (automating tasks)
* Analyzing data (modeling)
* Creating nicely formatted documents (communicating results)
* Building your own commands to do specific things (functions)
* Building very creative graphics

* Among many things...

And so.. what is Rstudio?
========================================================

Rstudio is just a nice software to run R!
 
<!-- Arreglar las imagenes -->

<div align="center">
<img src="./figures/rstudio_presentation.png" width=500 height=350>
</div>

***

<div align="center">
<img src="./figures/r_presentation.png" width=500 height=350>
</div>

And so.. what is Rstudio?
========================================================

<div align="center">
<img src="./figures/rstudio_workflow.png" width=500 height=350>
</div>

Let's get to it then!
========================================================

R is an interactive language. That means that if you type a number, you will get a number.


```r
10
```

```
[1] 10
```


```r
5
```

```
[1] 5
```

Introduction to R objects
========================================================

R is also a calculator!

Try typing these operations in R:

* `5 + 5`
* `10 - 5`
* `10 * 5`
* `20 / 10`
* `(10 * 20) - 5 / 2 + 2`

Before we continue, what type of operations are these?

Answers in next slide!

Introduction to R objects
========================================================

* Addition
* Subtraction
* Multiplication
* Division
* A combination of all

Numbers in R are called `numerics`.

For example:

```r
is.numeric(10)
```

```
[1] TRUE
```

```r
is.numeric(10 + 20)
```

```
[1] TRUE
```

```r
is.numeric(10 / 2)
```

```
[1] TRUE
```

Introduction to R objects
========================================================

Having single numbers, like 10, is not very useful.

We want something similar to a column of a dataset, like age or income.

We can do that with `c()`, which stands for `cocatenate`.


```r
c(32, 34, 18, 22, 65)
```

```
[1] 32 34 18 22 65
```

Read this expression as: concatenate these numbers into a single object.

Introduction to R objects
========================================================

We can also give it a name, like age.


```r
age <- c(32, 34, 18, 22, 65)
```

* Why didn't the result get printed?
* Where is this age object at?
* What is formally the age object?

Introduction to R objects
========================================================
We just created our first variable! Typical SAS/Excel/Stata column.

In R, these objects are called 'vectors'.

Vectors can have several flavours:

* Numerics (we just saw these)
* Logicals
* Characters
* Factors

Introduction to R objects
========================================================

Suppose these ages belong to certain people. We can create a character vector with their names.

Following this guideline, create it yourself.

* Create a character vector with `c()`
* Include the names Paul, Maria, Andres, Roberto and Alicia inside
* `wrap` every name in quotes like this "Paul", "Maria", etc...

Introduction to R objects
========================================================

Answer:


```r
c("Paul", "Maria", "Andres", "Robert", "Alicia")
```

```
[1] "Paul"   "Maria"  "Andres" "Robert" "Alicia"
```

We can also give it a name, like participants.


```r
participants <- c("Paul", "Maria", "Andres", "Robert", "Alicia")
```

Introduction to R objects
========================================================

Character vectors are filled by strings, like "Paul" or "Maria".

Can we do operations with strings?


```r
"Paul" + "Maria"
```

```
Error in "Paul" + "Maria": non-numeric argument to binary operator
```

Makes sense.. we can't add any letters.

Alright, we're set.  Concatenate the numeric vector `age` and `participants`.

Introduction to R objects
========================================================


```r
c(age, participants)
```

```
 [1] "32"     "34"     "18"     "22"     "65"     "Paul"   "Maria" 
 [8] "Andres" "Robert" "Alicia"
```


* What's the problem with this result?


========================================================

# This breaks an R law!

We joined a `numeric` vector and a `character` vector.

Vectors can *ONLY* be of one class.


```r
c(1, "one") # forces to character vector
```

```
[1] "1"   "one"
```

```r
c(1, "1") # note that the first one is a numeric, while the second is a character
```

```
[1] "1" "1"
```

Introduction to R objects
========================================================

Now, which of these people has an age above `20`?


```r
age > 20
```

```
[1]  TRUE  TRUE FALSE  TRUE  TRUE
```

* That's a logical vector.

Contrary to `character` and `numeric` vectors, `logical` vectors can only have three values:
* `TRUE`
* `FALSE`
* `NA`

Introduction to R objects
========================================================

`logicals` can be created manually or with a `logical` statement.


```r
c(TRUE, FALSE, TRUE, TRUE)
```

```
[1]  TRUE FALSE  TRUE  TRUE
```

```r
age < 60
```

```
[1]  TRUE  TRUE  TRUE  TRUE FALSE
```

The above expression tests for the logical statement.

For example,

```
   32    34    18    22    65 
 TRUE  TRUE  TRUE  TRUE FALSE 
```

Introduction to R objects
========================================================

You can also write `T` or `F` as short abbreviations of `TRUE` and `FALSE`.


```r
c(T, T, F, T) == c(TRUE, TRUE, FALSE, TRUE)
```

```
[1] TRUE TRUE TRUE TRUE
```

Which is comparing:


```
 TRUE  TRUE FALSE  TRUE 
  "T"   "T"   "F"   "T" 
```

But behind the scenes, `TRUE` and `T` are just a `1` and `F` and `FALSE` are just a `0`.

What is the result of this?


```r
T + 5
TRUE - 5
FALSE + TRUE
T + T - FALSE
```

Introduction to R objects
========================================================
incremental: true

Now that you know that.. what would be class of the vectors:


```r
c(5, TRUE)
c(5, "FALSE")
c(FALSE, TRUE)
c(1, FALSE)
```

* numeric: TRUE is coerced to 1
* character: "FALSE" is a string, can't be turned to a number
* logical: both elements are logical!
* numeric: FALSE is coerced to 0

Introduction to R objects
========================================================

What do we know so far?

* Numeric vectors
* Character vectors
* Logical vectors
* How to assign a name to these vectors
* Vectors can contain only *one* class

What's missing?

### Factors