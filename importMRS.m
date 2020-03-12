function vararg=importMRS(waterRef)
disp("Choose raw FID ")
[file,folds]=uigetfile( ...
    {'*.DICOM;*.IMA;*.nii',...
    'SIEMENS Files (*.DICOM,*.IMA)';
    }, ...
    'Select FID');
disp(['FID=  ' fullfile(folds,file)])
strsp=strsplit(folds,'\')
foldsMK=fullfile(strsp{1:end-2})

mkdir([foldsMK '\Analysis\Input\FID\'])
copyfile (fullfile(folds,file),[foldsMK '\Analysis\Input\FID\'])
vararg{1}=[foldsMK '\Analysis\Input\FID\' file]
mkdir([foldsMK '\Analysis\Output'])
if (waterRef==1)
    [fileWat,foldsWat]=uigetfile( ...
        {'*.DICOM;*.IMA;*.nii',...
        'SIEMENS Files (*.DICOM,*.IMA)';
        }, ...
        'Select Water Reference');
    disp(['Water Reference=  ' fullfile(foldsWat,fileWat)])
    strsp=strsplit(foldsWat,'\')
    foldsMK=fullfile(strsp{1:end-2})
    
    mkdir([foldsMK '\Analysis\Input\h2o\'])
    copyfile (fullfile(foldsWat,fileWat),[foldsMK '\Analysis\Input\h2o\'])
    vararg{2}=[foldsMK '\Analysis\Input\h2o\' fileWat]
    
end




end
