% Created by inferno086350 in Octave 

% Loading data in octave using load()

data = load('population_profit.txt');
X = data(:,1);   % X is a m x 1 vector for population
y = data(:,2);   % y is a m x 1 vector for profit

m = length(y);   % m is the number of training data sets
X = [ones(m,1) , X];   % Adding the ones to X first column X is now (m x 2)

theta = zeros(size(X,2),1);

function J = computeCostLinear (X, y, m, theta)

  J = (1/(2*m)) * ((X * theta - y)') * (X * theta - y);

endfunction

disp(sprintf('\nProgram is paused, press enter to continue...'))
pause;

disp(sprintf('\nCalculating value of cost function for theta = [0;0]'))
J = computeCostLinear(X, y, m, theta)

disp(sprintf('\nProgram is paused, press enter to continue...'))
pause;

iterations = 1500;
alpha = 0.01;

function theta0 = gradientDescentLinear(X,y,m,theta1,iterations,alpha)

  theta0 = theta1;

  for i = 1 : iterations,
    theta0 = theta0 - (alpha/m) * ((X') * (X * theta0 - y));
  endfor

endfunction

disp(sprintf('\nRunning Gradient Descent to find theta...'))
thetaNew = gradientDescentLinear(X,y,m,theta,iterations,alpha);
theta = thetaNew

% plot(X,y,'rx','MarkerSize',10)

disp(sprintf('\nProgram is paused, press enter to continue...'))
pause;

disp(sprintf('\nMaking predictions for population of 35000 and 70000:'))
predictedProfit = [1 , 3.5; 1 , 7] * theta;
predictedProfit(1) * 10000
predictedProfit(2) * 10000
