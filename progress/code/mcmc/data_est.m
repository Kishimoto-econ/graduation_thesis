FqReport8 = csvread('C:\Users\Kohsu\Desktop\graduation_thesis\progress\data\calibration.csv', 1, 0);

N_obs = FqReport8(:,5);
Y_obs = FqReport8(:,8);
b_obs = FqReport8(:,3);
q_obs = FqReport8(:,9);

save dset.mat b_obs q_obs Y_obs N_obs;

disp(b_obs);
disp(q_obs);
