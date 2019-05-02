dataFileName = 'Sarcasm_Headlines_Dataset.json';
dataSaveName = 'headlineData.mat';

fileID = fopen(dataFileName);
processedHeadlines = {};
y = [];
curLine = fgetl(fileID);
curIdx = 1;
while curLine ~= -1
    curArticle = jsondecode(curLine);
    processedHeadlines{curIdx, 1} = preprocessHeadline(curArticle.headline);
    y(curIdx, 1) = curArticle.is_sarcastic;
    curLine = fgetl(fileID);
    curIdx = curIdx + 1;
end

fclose(fileID);

save(dataSaveName, 'processedHeadlines', 'y');