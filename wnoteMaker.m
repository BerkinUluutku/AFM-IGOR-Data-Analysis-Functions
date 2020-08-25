function [wnotes] = wnoteMaker(wnotes_ugly)
%This functions puts wave notes in order as a structure. Easy to use and
%access. -Berkin


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
        
        %dots and spaces in variablenames are creating issues
        tmp_name = strrep(t_wnotes{i,1},' ','_');
        tmp_name = strrep(tmp_name,'.','_');
        
        %Everything here so far is an array of chars. Some are better as
        %numbers.
        tmp_val = str2num(t_wnotes{i,2});
        if isempty(tmp_val)
            tmp_val = t_wnotes{i,2};
        else
            %carry on my good man
        end
        
        wnotes.(tmp_name) = tmp_val;
    end
end

%order the fields alphabetically
wnotes = orderfields(wnotes);


end

