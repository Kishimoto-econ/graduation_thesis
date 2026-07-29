FqReport8 = csvread('C:\Users\Kohsu\Desktop\graduation_thesis\progress\data\calibration.csv', 1, 0);

Y_obs = FqReport8(:,13);
R = FqReport8(:,3);

save dset.mat Y_obs R;

disp(Y_obs);
disp(R);
