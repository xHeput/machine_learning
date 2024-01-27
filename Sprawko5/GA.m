% Wybieranie liczby zmiennych
numVars = 1; 

% Ustalanie dolnych i górnych granic dla zmiennej
lb = double([-10]); % Dolne granice dla zmiennej
ub = double([10]); % Górne granice dla zmiennej

% Przykłady zmiany parametrów
parameters = {'PopulationSize', 'MaxGenerations', 'Function', 'LowerBound'};
values = {[50, 100], [100, 200], @myFunction, {-10, -20}};

% Inicjalizacja komórki do przechowywania subplotów
allSubplots = cell(1, length(parameters));

% Przechodzenie przez wszystkie wartości dla danego parametru
for j = 1:length(values{1})
    % Inicjalizacja subplotów
    subplots = zeros(1, length(parameters));

    % Przechodzenie przez wszystkie warianty
    for i = 1:length(parameters)
        
        % Ustalanie wartości parametru
        if strcmp(parameters{i}, 'PopulationSize')
            options = optimoptions('ga', 'PopulationSize', values{i}(j), 'MaxGenerations', 100);
        elseif strcmp(parameters{i}, 'MaxGenerations')
            options = optimoptions('ga', 'PopulationSize', 50, 'MaxGenerations', values{i}(j));
        elseif strcmp(parameters{i}, 'Function')
            options = optimoptions('ga','PopulationSize',50,'MaxGenerations',100,'FunctionTolerance',1e-6,parameters{i},values{i}(j));
        elseif strcmp(parameters{i}, 'LowerBound')
            if isnumeric(values{i}{j})
                lb = double(values{i}{j});
            end
            ub = double([10]);
        end
        
   
        
        % Przeprowadzanie optymalizacji za pomocą algorytmu GA
        [x,fval] = ga(@myFunction,numVars,[],[],[],[],lb,ub,[],[],options);
        
        % Drukowanie wyniku
        disp(['Parameter: ', parameters{i}]);
        if isnumeric(values{i}(j))
            disp(['Value: ', num2str(values{i}(j))]);
        elseif ischar(values{i}(j))
            disp(['Value: ', values{i}(j)]);
        end
        disp(['Best solution: ', num2str(x)]);
        
      
    end
    
   
end



% Definiowanie funkcji celu
function y = myFunction(x)
    y = x^2;
end
