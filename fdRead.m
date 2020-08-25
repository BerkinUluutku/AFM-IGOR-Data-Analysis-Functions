function [data, wnotes] = fdRead(path, file_name)
%This is a function to read FD afm curves. -Berkin


%import file
raw_import = IBWread([path file_name]);
fclose('all'); %IBWread does not close the file sometimes.



%organise wave notes
wnotes = wnoteMaker(raw_import.WaveNotes);

data.deflection = raw_import.y(:,2);
data.z = raw_import.y(:,3);


[~, i] = max(raw_import.y(:,3));

data.app.deflection = data.deflection(1:i);
data.app.z = data.z(1:i);


data.ret.deflection = fliplr(data.deflection((i+1):end));
data.ret.z = fliplr(data.z((i+1):end));
data.time = ((data.app.z-(data.app.z(1))) / wnotes.ApproachVelocity);

end