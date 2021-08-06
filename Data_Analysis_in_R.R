# Beta Binomial Analysis and Distribution in R
# Suppose we are giving two students a multiple choice exam with 40 questions. 
# For each questions has four choices. 
# We don't know how much the students have studied for this exam but we think that they will do better 
# than just guessing randomly.

# what are our parameters of interest?
# Parameters of interest are theta1=true probability the first student will answer a question
# correctly, and theta2=true probability the second student will answer a question correctly.

# what is our Likelihood?
# Likelihood is Binomial(40, theta), if we assume that each question is independent and that the
# probability a student gets each question right is the same for all questions for that student

# What prior should we use?
# The conjugate prior is a beta prior.
theta = seq(from=0, to=1, by=0.1)
plot(theta, dbeta(theta, 1,1), type="l")
plot(theta, dbeta(theta, 4,2), type="l")
plot(theta, dbeta(theta, 8,4), type="l")

# Find the probabilities using pbeta function?
1-pbeta(.25,8,4)
1-pbeta(.5,8,4)
1-pbeta(.8,8,4)

# Posterior distribution
41/(41+11) # posterior mean
33/40 # MLE

lines(theta,dbeta(theta, 41, 11))
# Plot posterior first to get the right scale on the y-axis
plot(theta, dbeta(theta, 41,11), type="l")
lines(theta,dbeta(theta, 8, 4),lty=2)

# plot the likelihood
lines(theta,dbinom(33, size=40,p=theta),lty=3)
# Plot on same scale
lines(theta,44*dbinom(33, size=40,p=theta),lty=3)

# Posterior Probabilities
1-pbeta(.25,41,11)
1-pbeta(.5,41,11)
1-pbeta(.8,41,11)

# Equal tailed 95%
qbeta(0.025,41,11)
qbeta(0.975,41,11)

# 2nd Student - 24 Questions
# Posterior is Beta(8+24,4+40-24) = Beta(32,20)
32/(32+20) # Posterior Mean
24/40 #MLE

#Plot Posterior
plot(theta, dbeta(theta, 32,20), type="l")
lines(theta,dbeta(theta, 8, 4),lty=2)
lines(theta,44*dbinom(24, size=40,p=theta),lty=3)

# Posterior Probabilities
1-pbeta(.3,2,2)
1-pbeta(.5,32,20)
1-pbeta(.8,32,20)

# Equal tailed 95%
qbeta(0.025,32,20)
qbeta(0.975,32,20)

# What is the probability that theta1 > theta2?
# Do it with simulation. Draw a 1000 samples from each and observe
theta1= rbeta(1000,41,11)
theta2 = rbeta(1000, 32,20)
mean(theta1>theta2) # Empirical Probability
