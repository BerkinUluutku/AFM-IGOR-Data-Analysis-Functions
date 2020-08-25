function [data, wnotes] = bimodalRead(path,file_name)
%This is a function to read bimodal afm images or anything that is done
%with Asylums dualAC mode. 


%import file
raw_import = IBWread([path file_name]);

%organise wave notes
wnotes = wnoteMaker(raw_import.WaveNotes);

[~, ~, i] = size(y);

if i == 12
data.height_trace = raw_import.y(:,:,1);
data.height_retrace = raw_import.y(:,:,2);
data.amp_1_trace = raw_import.y(:,:,3);
data.amp_1_retrace = raw_import.y(:,:,4);
data.amp_2_trace = raw_import.y(:,:,5);
data.amp_2_retrace = raw_import.y(:,:,6);
data.phase_1_trace = raw_import.y(:,:,7);
data.phase_1_retrace = raw_import.y(:,:,8);
data.phase_2_trace = raw_import.y(:,:,9);
data.phase_2_retrace = raw_import.y(:,:,10);
data.z_trace = raw_import.y(:,:,11);
data.z_retrace = raw_import.y(:,:,12);

if i == 6
data.height_retrace = raw_import.y(:,:,1);
data.amp_1_retrace = raw_import.y(:,:,2);
data.amp_2_retrace = raw_import.y(:,:,3);
data.phase_1_retrace = raw_import.y(:,:,4);
data.phase_2_retrace = raw_import.y(:,:,5);
data.z_retrace = raw_import.y(:,:,6);
else
    disp('Incorrect number of AFM images');
end

%For easy access
data.system.k = wnotes.SpringConstant;
data.system.f1 = wnotes.DriveFrequency;
data.system.f2 = wnotes.DriveFrequency1;
data.system.Q = wnotes.TuneQResult;

end