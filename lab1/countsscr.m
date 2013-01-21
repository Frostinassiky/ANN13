c = sign(W*X);
[uniqueC,~,idx] = unique(c); %# uniqueC are unique entries in c
                             %# replace the tilde with 'dummy' if pre-R2008a

counts = accumarray(idx(:),1,[],@sum);

uniqueC
countCell = num2cell(counts)