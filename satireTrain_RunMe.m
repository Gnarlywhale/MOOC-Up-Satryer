dataFileName = 'Sarcasm_Headlines_Dataset.json';

fileID = fopen(dataFileName);

X = [];
y = [];
curLine = fgetl(fileID);
curIdx = 1;
while curLine ~= -1
    curArticle = jsondecode(curLine);
    
    y(curIdx) = curArticle.is_sarcarstic;
    curLine = fgetl(fileID);
    curIdx = curIdx + 1;
end