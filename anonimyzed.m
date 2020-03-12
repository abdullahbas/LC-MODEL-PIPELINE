function anon = anonimyzed(Inpath,varargin)

Inpath=convertCharsToStrings(Inpath)

if ~isempty(varargin)
    varargin{1}=convertCharsToStrings(varargin{1})
    
    commandStr = sprintf('python %s/anon.py --inputRaw "%s" --outputRaw "%s"',pwd,Inpath,varargin{1})
    disp("asdasdasd")
    
else
    
    commandStr = sprintf('python "%s"/anon.py --inputRaw "%s"',pwd,Inpath)
    
    
end



[status, commandOut] = system(commandStr)
anon= convertCharsToStrings(commandOut)
end