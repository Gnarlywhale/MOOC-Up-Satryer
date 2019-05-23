% Load pre-processed headline data set, and convert each email into a
% vector of features

headlineFileName = 'processedHeadlineData.mat'; % Should contain 2 variables:
                                            % processedHeadlines - cell array of pre-processed headlines
                                            % y - vector of 0s (not sarcastic) and 1s (is sarcastic)
featureDictionaryFileName = 'featureDictionary.mat'; % Should contain 1 variable: dictCount - cell array of most common headline wor                                            
dataSaveName = 'headlineFeatureData.mat';

load(headlineFileName);
load(featureDictionaryFileName);
numHeadlines = length(processedHeadlines);

% Initialize X variable - matrix of dictionary vectors for each headline 
X = zeros(numHeadlines, length(dictCount));

% Create feature vector for each headline
for headlineNum = 1:numHeadlines
    disp(headlineNum) % Display current loop iteration
    curHeadline = processedHeadlines{headlineNum};
    
    while ~isempty(curHeadline)
        [curWord, curHeadline] = ...
            strtok(curHeadline, ...
            [' @$/#.-:&*—+=[]?!(){?},''">_<;%' char(10) char(13)]);
        % Apply Porter Stemming algorithm
        try curWord = porterStemmer(strtrim(curWord));
        catch curWord = ''; continue;
        end
        % Skip the word if it is too short
        if length(curWord) < 1
            continue;
        end
        
        %  Check if current word is in feature dictionary
        strIdx = find(strcmp(dictCount, curWord));
        if ~isempty(strIdx)
            X(headlineNum, strIdx) = 1;
        end
    end
end

save(dataSaveName, 'X', 'y');




