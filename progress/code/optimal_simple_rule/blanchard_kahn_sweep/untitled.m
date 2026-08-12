% 1. Dynareの実行 (モデル情報をワークスペースに読み込む)
% ※拡張子なしのmodファイル名を指定してください (例: untitled)
dynare osr_param noclearall nolog

global M_ options_ oo_

% 2. パラメータのインデックスを取得
idx_q = strmatch('gamma_q', M_.param_names, 'exact');
idx_N = strmatch('gamma_N', M_.param_names, 'exact');
idx_Y = strmatch('gamma_Y', M_.param_names, 'exact');

% 3. 探索するグリッドの範囲と刻み幅を定義
% ※計算量が多くなるので、最初は狭い範囲・粗い刻み幅をおすすめします
grid_q = -5 : 1 : 5;
grid_N = -5 : 1 : 5;
grid_Y = -5 : 1 : 5;

valid_params = [];

% 4. stoch_simul の出力を完全に抑制して高速化
options_.noprint = 1; 
options_.irf = 0;     % IRFは不要なのでスキップ
options_.order = 1;   % 1次近似のみ

disp('BK条件のグリッドサーチを開始します...');

% 5. グリッドサーチの実行
for g_q = grid_q
    for g_N = grid_N
        for g_Y = grid_Y
            % パラメータを更新
            M_.params(idx_q) = g_q;
            M_.params(idx_N) = g_N;
            M_.params(idx_Y) = g_Y;
            
            % Dynare 6系対応: stoch_simul を使って安全にチェック
            try
                % var_list_ に空の配列 [] を渡す
                [info, oo_temp, options_temp, M_temp] = stoch_simul(M_, options_, oo_, []);
                
                % info(1) == 0 ならばBK条件（一意の安定解）を満たす
                if info(1) == 0
                    valid_params = [valid_params; g_q, g_N, g_Y];
                end
            catch
                % モデルが解けずにエラーを吐いた場合はスキップ
                continue;
            end
        end
    end
end

disp('探索完了。');

% 6. 結果の可視化
if ~isempty(valid_params)
    fprintf('BK条件を満たす組み合わせが %d 個見つかりました。\n', size(valid_params, 1));
    
    figure;
    scatter3(valid_params(:,1), valid_params(:,2), valid_params(:,3), 20, 'filled', 'MarkerFaceColor', [0 0.4470 0.7410]);
    xlabel('\gamma_q');
    ylabel('\gamma_N');
    zlabel('\gamma_Y');
    title('Blanchard-Kahn条件を満たすパラメータ領域');
    grid on;
else
    disp('指定されたグリッド範囲内にBK条件を満たすパラメータは見つかりませんでした。');
end