FqReport8 = csvread('C:\Users\Kohsu\Desktop\graduation_thesis\progress\data\calibration.csv', 1, 0);

q_obs = FqReport8(:,1);
R_obs = FqReport8(:,3);
b_obs = FqReport8(:,4);
Y_obs = FqReport8(:,13);

save dset.mat q_obs R_obs b_obs Y_obs;

disp(q_obs);
disp(b_obs);
