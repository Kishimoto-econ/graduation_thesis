% ----------------------------------------------------
% 生成されたすべての図をPNG形式で保存するMATLABコード
% ----------------------------------------------------
FolderName = 'saved_figures';
if ~exist(FolderName, 'dir')
    mkdir(FolderName);
end

FigList = findobj(allchild(0), 'flat', 'Type', 'figure');
for iFig = 1:length(FigList)
    FigHandle = FigList(iFig);
    FigName   = get(FigHandle, 'Name');
    
    % 図に名前がない場合は番号を付ける
    if isempty(FigName)
        FigName = sprintf('figure_%d', iFig);
    end
    
    % ファイル名に使用できない文字をアンダースコアに置換
    FigName = regexprep(FigName, '[\\/:*?"<>|]', '_');
    
    % PNG形式で保存
    saveas(FigHandle, fullfile(pwd, FolderName, [FigName, '.png']));
end