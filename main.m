function main()

ks = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
lambdas = [0, 1, 2, 3, 4, 5];

for k = ks
    for lambda = lambdas
        main_plot(k, lambda)
    end
end

end