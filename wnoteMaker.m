function [wnotes] = wnoteMaker(wnotes_ugly)
%This functions puts wave notes in order as a structure. Easy to use and
%access. 


%Creating a cell arrayof wave notes. Useful while searching for AFM scan
%variables.
temp = splitlines(wnotes_ugly);
for i = 1:length(temp)
    temp2{i} = strsplit(temp{i},':');
    t_wnotes{i,1} = temp2{i}{1};
    t_wnotes{i,2} = temp2{i}{end};
end

%Making wave notes a structure. Its more convenient than cell array.
for i = 1 : length(t_wnotes)
    if(~isempty(t_wnotes{i,2}))
        wnotes.(t_wnotes{i,1}) = t_wnotes{i,2};
    end
end

end

