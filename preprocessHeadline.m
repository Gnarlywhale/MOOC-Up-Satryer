function headline = preprocessHeadline(headline)
% processHeadline: preprocesses a the text of a headline
%   
%

% % Convert all text to lowercase
% email_contents = lower(email_contents);

% Handle Numbers
% Look for one or more characters between 0-9
headline = regexprep(headline, '[0-9]+', 'number');

% Handle $ sign
headline = regexprep(headline, '[$]+', 'dollar');

% Handle unicode characters
headline = sprintf(strrep(headline, '\u', '\x'));

% Replace '...' with 'ellipsis'
headline = strrep(headline, '...', ' ellipsis');

% Replace remaining '.' with ' period'
headline = strrep(headline, '.', ' period ');

% Replace '!' with ' exclamationPoint'
headline = strrep(headline, '!', ' exclamationPoint');

% Replace '?' with ' questionMark'
headline = strrep(headline, '?', ' questionMark');

end