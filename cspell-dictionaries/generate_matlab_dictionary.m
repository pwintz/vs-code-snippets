% Generate a list of all directories searched by MATLAB:
pathlist = strsplit(path,pathsep);
% Get functions and classes on search path
functions = {};
classes = {};
for p = pathlist
   w = what(p{1});
   functions = [functions; ...
                erase(w.m,'.m'); ...           % M-files
                erase(w.mex,['.',mexext]); ... % MEX-files
                erase(w.p,'.p')];              % and P-files are all functions
   classes = [classes; w.classes];             % here are all classes 
   % TODO: w.packages gives package directory names, examine those too!
end
% Remove duplicates
functions = unique(functions);
classes = unique(classes);

file_id = fopen('C:\Users\pwintz\AppData\Roaming\Code\User\cspell-dictionaries\matlab.txt', 'w');
fprintf(file_id, '%s\n', functions{:}, classes{:});
% classes