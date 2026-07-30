steady;
check;

verbatim;
    idx = @(name) find(strcmp(M_.endo_names,name));

    q_ss_num  = oo_.steady_state(idx('q'));
    k_ss_num  = oo_.steady_state(idx('k'));
    b_ss_num  = oo_.steady_state(idx('b'));
    x_ss_num  = oo_.steady_state(idx('x'));
    Rf_ss_num = oo_.steady_state(idx('R_f'));
    qf_ss_num = oo_.steady_state(idx('q_f'));

    fprintf('\n=== Occbin Regime Consistency Check @ Steady State ===\n');

    % --- borrowing制約: relax条件 R_f*b < q_f*k ---
    lhs1 = Rf_ss_num * b_ss_num;
    rhs1 = qf_ss_num * k_ss_num;
    fprintf('[borrowing] R_f*b = %10.6f   q_f*k = %10.6f   ', lhs1, rhs1);
    if lhs1 < rhs1
        fprintf('-> OK (non-bind)\n');
    else
        fprintf('-> VIOLATION (本来はbindすべき!)\n');
    end

    % --- consumption制約: relax条件 x > c*k(-1) ---
    rhs2 = c * k_ss_num;
    fprintf('[cons]      x     = %10.6f   c*k   = %10.6f   ', x_ss_num, rhs2);
    if x_ss_num > rhs2
        fprintf('-> OK (non-bind)\n');
    else
        fprintf('-> VIOLATION (フロア割れ、本来はbindすべき!)\n');
    end
    fprintf('========================================================\n\n');
end;