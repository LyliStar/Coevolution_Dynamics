#! /usr/bin/env python
import numpy as np
from scipy.stats import truncnorm
import matplotlib
import matplotlib.pyplot as plt
import time
import sys
import pandas as pd

matplotlib.rcParams['xtick.direction'] = 'in'
matplotlib.rcParams['ytick.direction'] = 'in'

class Population:
    def __init__(self,num):

        self.num = num
        self.num_list = []
        self.time_list = []

    def population_birth(self):
        self.num += 1

    def population_death(self):
        self.num -= 1

    def population_mutation(self):
        new_population = Population(num=1)
        current_population.append(new_population)

    def record_data(self):
        self.time_list.append(t)
        self.num_list.append(self.num)

def findreaction(*reactionrates):
    sum_rs = np.array([np.sum(np.reshape(i, (i.size,))) for i in reactionrates])
    sum_all = sum(sum_rs)
    tau = - np.log(np.random.rand())/sum_all
    i = int(randchoice(sum_rs)[0])
    index = int(randchoice(reactionrates[i])[0])
    return tau, i , index

def randchoice(a):
    veca = a.reshape(np.prod(a.shape))
    onea = veca / sum(veca)
    index = np.argwhere(a == np.random.choice(veca, p = onea))[0]
    return index

def extinction_check(current_population, extinct_population, s=0):
    while s < len(current_population):
        if current_population[s].num == 0:
            extinct_population.append(current_population[s])
            del current_population[s]
        else:
            s += 1

def mutpayoff(payoff, i):
    l = payoff.shape[1]
    s = l + 1
    newpayoff = np.zeros((s, s))
    newpayoff[0:l, 0:l] = payoff
    for k in range(l):
        newpayoff[l,k] = 0.1 * np.random.randn(1,1) + payoff[i,k]
        newpayoff[k,l] = 0.1 * np.random.randn(1,1) + payoff[k,i]
    newpayoff[l,l] = 0.1 * np.random.randn(1,1) + np.diag(payoff)[i]
    return newpayoff

def mutfunc(c, i):
    c = mutpayoff(c, i)
    return c

birthrates = 0.6
deathrates = 0.1
mutrate = 0.0001
t = 0
T = 1000
M = 100
begin_time = []
end_time = []
payoff = np.array([[1]])
ancestor_popolation = Population(num=10)
current_population = [ancestor_popolation]
extinct_population = []

while t < T:
    populations_num = np.array([population.num for population in current_population])
    extinction_check(current_population, extinct_population)
    birth_nomut = birthrates * populations_num * (1-mutrate)
    birth_mut = birthrates * populations_num * mutrate
    death = deathrates * populations_num
    competition = (populations_num[:, np.newaxis]) * populations_num * payoff/M
    tau, i, index = findreaction(birth_nomut, birth_mut, death, competition)
    t = t + tau
    if i == 0:
        current_population[index].population_birth()
    elif i == 1:
        newpop = Population(1)
        current_population.append(newpop)
        payoff = mutfunc(payoff, index)
    elif i in(2,3):
        current_population[index].population_death()
        if current_population[index].num == 0:
            a = current_population.pop(index)
            extinct_population.append(a)
            payoff = np.delete(payoff, index, 0)
            payoff = np.delete(payoff, index, 1)
    for population in current_population :
        population.record_data()

total_population = current_population + extinct_population
num = []
for population in total_population:
    num.append(max(population.num_list))
    plt.plot(population.time_list, population.num_list)
plt.xlabel("time",fontsize = 9)
plt.ylabel("Density of individuals", fontsize=9)
yloc = max(num)
plt.text(x=700, y=yloc-5, s='M=100 mu=0.0001\nsigma=0.1')
plt.show()




