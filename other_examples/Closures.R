# Closures
# A closure is a bit of an strange concept for a functional programming beginner First: Functions can not only return values as their result, but also other functions!
#         Join me in this little sequence of commands, which are related to R Progamming course, Assignment.
# Suppose we have

createClosure <- function() {   
        x <-5; # the closures state, will be enclosed in the environment  
        productFunction <- function() { x + 6 }   
        return(productFunction)  
}   
# Now we gonna call...

product <- createClosure()

# What is "product"? Let's inspect it a bit...type into console

product

# Oh, it's a function WITH an environment (the 0x number you see might differ)
# function() { x + 6 }  
# <environment: 0x0000000015e1e2b0> 
# I see it's a function, then I bet we can call it? I bet you know what you get, when you type
product()

# Sure, that was easy, right?
# [1] 11

# Optional: Can you figure out what we need to change to the code, to be able to
# add arbitrarty numbers with 5. So we want to type "product(9)" and get "14" as
# result Okay, anyway, environment sounds fancy, can you show me more about
# that? Yes, type

environment(product)

# Seems like this is the same environemt 15e1e2b0 (the 0x number you see might differ)
# <environment: 0x0000000015e1e2b0> 
#         But what the heck can I do with an environemnt? Let's check out what is bound to it, type

ls(environment(product))

# Surprise, surprise...it's x and productFunction... [1] "productFunction" "x" 
# so by returning a function from another function, call it the "creator"
# function all values that exist in it's scope (simlified think of the brackets
# { } which enclose the code of the outer function) will be put into the
# environment! Can we do more? Sure...what do you want to know? The value of
# "x"?. Here we go...

get("x",environment(product))

# This will give you [1] 5 Okay x is called a bound variable. In our example it
# will never change. Does one of your bound variable probably change when you
# use the assignment code? Do we have to use a special operator for that? Which
# varaible is meant and which oeprator? Can you make use of get() to show when
# the variable changes? okay, why do we use get here...can't we just use "x" to
# print the value of x? Let's try it type "x" Error: object 'x' not found Okay,
# we see that get("x",environment(product)) is different form just saying "x"? 
# But have you heard of the globalEnvironment? It's quit like any other
# environement... let's see, what will be?

x <-7  
get("x",environment(product))  
get("x",.GlobalEnv)
Run it and it'll print and think about what .GlobalEnv is...
[1] 5  
[1] 7
Kind of weird, isn't it? So we have different environemnts in R...yes? Are they connected? Sure...each environment has a parent...Let's check it out
parent.env(environment(product))
Surprise, surprise
<environment: R_GlobalEnv>
So what does this mean about the way R uses environments to find the value of variables?
Now it's your turn!
1. Do you know what is equivalent to my "createClosure" function in the assignment?
2. Try to find what is equivalent to my closure variable "x"
3. How can you get hold of the environment of the created "Object"
4. Now let's inspect it's environment and get the vlaues
5. Does the value change when you use setMean()?