% While Loop
p = 2;
while (p <= 8)
    q = p^2 - (2 * p);
    disp(q);
    p = p + 2;
end

% Continue (melewati iterasi saat i == 4)
for i = 1:5
    if (i == 4)
        continue;
    end
    p = i^2 + 1;
    disp(p);
end

% Break (menghentikan perulangan saat i == 4)
for i = 1:5
    if (i == 4)
        break;
    end
    p = i^2 + 1;
    disp(p);
end
