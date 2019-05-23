sanitizedDataFileName = 'headlineData.mat';

load(sanitizedDataFileName); % Should load variables: 'processedHeadlines' and 'y'

dictCount = {};
for i = 1:length(processedHeadlines)
    i % Display current loop iteration
    curHead = processedHeadlines{i};
    while ~isempty(curHead)
        [str, curHead] = ...
            strtok(curHead, ...
            [' @$/#.-:&*—+=[]?!(){?},''">_<;%' char(10) char(13)]);
        
        try str = porterStemmer(strtrim(str));
        catch str = ''; continue;
        end;
        
        % Skip the word if it is too short
        if length(str) < 1
            continue;
        end
        if isempty(dictCount)
           dictCount{1,1} = str;
           dictCount{1,2} = 1;
        elseif any(strcmp(dictCount(:,1),str))
            dictCount{find(strcmp(dictCount(:,1),str)),2} = dictCount{find(strcmp(dictCount(:,1),str)),2}+1;
        else
            dictCount{end+1,1} = str;
           dictCount{end,2} = 1;
        end
    end
end
dictCount = sortrows(dictCount,2,'descend');
dictCount = dictCount(1:2000);
save('FeatureDictionary','dictCount');