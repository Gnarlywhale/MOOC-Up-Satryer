function prediction = headlinePredictor(headline, model,dictCount)
curHeadline = preprocessHeadline(headline);
x = zeros(length(dictCount),1);
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
           x(strIdx) = 1;
        end
 end
    
 prediction = svmPredict(model,x);