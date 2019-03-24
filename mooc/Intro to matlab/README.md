## Introduction to Programming with MATLAB

> I have finished the course in Mar, 2019. You can see it in [here](https://www.coursera.org/account/accomplishments/verify/ZFVHTNMDDV6J) or in [my LinkedIn Page](https://www.linkedin.com/in/yujie-he/)
[调试](https://ww2.mathworks.cn/help/matlab/debugging-code.html), [函数优先顺序](https://ww2.mathworks.cn/help/matlab/matlab_prog/function-precedence-order.html), [默认参变量(nargin/nargout)](https://www.cnblogs.com/zjutzz/p/5996161.html), 变量(Local, Global, Persistent), [xlsread](https://ww2.mathworks.cn/help/matlab/ref/xlsread.html), [文件操作及读txt文件(fopen,fseek,fread,fclose)](https://www.cnblogs.com/AI-Algorithms/p/3674344.html)

```matlab
% week3_ex2
function [tl, tr, bl, br] = corners(A)
  tl = A(1, 1);
  tr = A(1, end);
  bl = A(end, 1);
  br = A(end, end);
end

A = randi(100,4,5)
[top_left, top_right, bottom_left, bottom_right] = corners(A)
B = [1; 2]
[top_left, top_right, bottom_left, bottom_right] = corners(B)
```

- **Taxi Fare**

Write a function called taxi_fare that computes the fare of a taxi ride. It takes two inputs: the distance in kilometers (d) and the amount of wait time in minutes (t). The fare is calculated like this: 

- the first km is $5 
- every additional km is $2 
- and every minute of waiting is $0.25. 

Once a km is started, it counts as a whole (Hint: consider the ceil built-in function). The same rule applies to wait times. You can assume that d >0 and t >= 0 but they are not necessarily integers. The function returns the fare in dollars. For example, a 3.5-km ride with 2.25 minutes of wait costs $11.75. Note that loops and if-statements are neither necessary nor allowed.

```matlab
% week3_ex3
function Fare = taxi_fare(d, t)
	Fare = 5 + 2 * ceil(d-1) + 0.25 * ceil(t)
end

fare = taxi_fare(3.5,2.25)
```

- **Minimum and Maximum**

Write a function called minimax that takes M, a matrix input argument and returns mmr, a row vector containing the absolute values of the difference between the maximum and minimum valued elements in each row. As a second output argument called mmm, it provides the difference between the maximum and minimum element in the entire matrix. 

```matlab
function [mmr, mmm] = minimax(M)
    mmr = max(M') - min(M');
    mmm = max(M(:)) - min(M(:));
end
 
>> A = randi(100,3,4)
A =
    66    94    75    18
     4    68    40    71
    85    76    66     4
>> [x, y] = minimax(A)
x =
    76    67    81
y =
    90
```

- **Matrix Construction**

Write a function called trio that takes two positive integer inputs n and m. The function returns a 3n-by-m matrix called T. The top third of T (an n by m submatrix) is all 1s, the middle third is all 2-s while the bottom third is all 3-s. For an example,see the code below:

```matlab
M = trio(2,4)
M =
     1     1     1     1
     1     1     1     1
     2     2     2     2
     2     2     2     2
     3     3     3     3
     3     3     3     3
     
function T = trio(n, m)
    base = ones(n, m);
    T = [base; 2 * base; 3 * base];
end
```

- **More Practice**

Write a function called **eligible** that helps the admission officer of the Graduate School of Vanderbilt University decide whether the applicant is eligible for admission based on GRE scores. The function takes two positive scalars called **v** and **q** as input and returns the logical **admit** as output. They represent the percentiles of the verbal and quantitative portions of the GRE respectively. You do not need to check the inputs. The applicant is eligible if the average percentile is at least 92% and both of the individual percentiles are over 88%. The function returns logical true or false value. 

```matlab
function admit = eligible(v, q)
    avg = (v + q)/2;
    if avg >= 92 && v > 88 && q > 88
        admit = true;
    else
        admit = false;
    end
end

admit = eligible(96,89)
admit = eligible(88,99)
admit = eligible(92,91)
```

- **Variable Number of Input Arguments** (nargin/nargout)

Write a function called **under_age** that takes two positive integer scalar arguments: 

1. **age** that represents someone's age, and 
2. **limit** that represents an age limit. 

The function returns **true** if the person is younger than the age limit. If the second argument, **limit**, is not provided, it defaults to 21. You do not need to check that the inputs are positive integer scalars. The name of the output argument is **too_young**.

```matlab
function too_young = under_age(age, limit)
    if (nargin<2)
        limit = 21;
    end
    too_young = age < limit;
end		

too_young = under_age(18,18)
too_young = under_age(20)
```

- **Wrap-up**

Write a function called **valid_date** that takes three positive integer scalar inputs **year, month, day.** If these three represent **a valid date**, return a logical **true**, otherwise **false**. The name of the output argument is **valid**. If any of the inputs is not a **positive integer scalar**, return false as well. Note that every year that is exactly divisible by 4 is a leap year, except for years that are exactly divisible by 100. However, years that are exactly divisible by 400 are also leap years. For example, the year 1900 was not leap year, but the year 2000 was. Note that your solution must not contain any of the date related built-in MATLAB functions.	

```matlab
function valid = valid_date(year, month, day)
    if isscalar(year) == 0 || isscalar(month) == 0 || isscalar(day) == 0
        valid = false;
    else
        if rem(year, 1) ~= 0 || rem(month, 1) ~= 0 || rem(day, 1) ~= 0
            valid = false;
        else
            if month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12
                valid = (day <= 31 && day > 0);
            elseif month == 4 || month == 6 || month == 9 || month == 11
                valid = (day <=30 && day > 0);
            elseif month == 2
                if (mod(year, 400) == 0) || (mod(year, 100) ~= 0  && mod(year, 4) == 0)
                    valid = (day <= 29 && day > 0);
                else
                    valid = (day <= 28 && day > 0);
                end
            else
                valid = false;
        end
	end
end
```

### Lesson 6

- **Practice for-loops**

Write a function called halfsum that takes as input a matrix and computes the sum of its elements that are in the diagonal or are to the right of it. The diagonal is defined as the set of those elements whose column and row indexes are the same. In other words, the function adds up the element in the uppertriangular part of the matrix. The name of the output argument is summa.

For example, with the matrix below as input. The function would return 26 (1 + 2 + 3 + 5 + 6 + 9 = 26)

```matlab
A = 
     1     2     3
     4     5     6
     7     8     9

function summa = halfsum(A)
    summa = 0;
    [row, col] = size(A);
    for r = 1:row
        for c = r:col
            summa = summa + A(r,c);
        end
    end
end

summa = halfsum([1 2 3; 4 5 6; 7 8 9])
ans = 26
```

- **Practice while-loops**

Write a function called next_prime that takes a scalar positive integer input n. Use a while-loop to find and return k, the smallest prime number that is greater than n. Feel free to use the built-in isprime function. Here are some example runs:

```matlab
function k = next_prime(n)
     k = n + 1;
     while ~isprime(k)
            k = k + 1
        end
    %end 
end

>> next_prime(2)
ans =
     3
>> next_prime(8)
ans =
    11
>> next_prime(12345678)
ans =
    12345701
```

- **Logical Arrays Practice**

Write a function called freezing that takes a vector of numbers that correspond to daily low temperatures in Fahrenheit. Return numfreeze, the number of days with sub freezing temperatures (that is, lower than 32 F) without using loops. Here is an example run:

```matlab
function numfreeze = freezing(A)
    numfreeze = sum(A < 32);
end

numfreeze = freezing([45 21 32 31 51 12])
numfreeze =
     3
```

- **Lesson 6 Wrap-up**

Write a function called max_sum that takes v, a row vector of numbers, and n, a positive integer as inputs. The function needs to find the n consecutive elements of v whose sum is the largest possible. In other words, if v is [1 2 3 4 5 4 3 2 1] and n is 3, it will find 4 5 and 4 because their sum of 13 is the largest of any 3 consecutive elements of v. If multiple such sequences exist in v, max_sum returns the first one. The function returns summa, the sum as the first output argument and index, the index of the first element of the n consecutive ones as the second output. If the input n is larger than the number of elements of v, the function returns 0 as the sum and -1 as the index. Here are a few example runs: 

```matlab
function [summa, index] = max_sum(v, n)
    L = numel(v);
    if n > L
        summa = 0;
        index = - 1;
    else
        summa = sum(v(1:n)); % 避免数量为负的情况
        index = 1;
        for i = 2 : (L - n + 1)
            f(i) = sum(v(i : i + n - 1));
            if f(i) > summa
                summa = f(i);
                index =i;
            end
        end
    end
end

[summa, index] = max_sum([1 2 3 4 5 4 3 2 1],3)
    summa = 13 
    index = 4
[summa, index] = max_sum([1 2 3 4 5 4 3 2 1],2) 
    summa = 9 
    index = 4
[summa, index] = max_sum([1 2 3 4 5 4 3 2 1],1) 
    summa = 5 
    index = 5
[summa, index] = max_sum([1 2 3 4 5 4 3 2 1],9) 
    summa = 25 
    index = 1
[summa, index] = max_sum([1 2 3 4 5 4 3 2 1],10) 
    summa = 0 
    index = -1 
```

### Lesson 7

- **Simple Encryption**

Caesar's cypher is the simplest encryption algorithm. It adds a fixed value to the ASCII (unicode) value of each character of a text. In other words, it shifts the characters. Decrypting a text is simply shifting it back by the same amount, that is, it substract the same value from the characters. Write a function called caesar that accepts two arguments: the first is the character vector to be encrypted, while  the second is the shift amount. The function returns the output argument coded, the encrypted text. The function needs to work with all the visible ASCII characters from space to ~. The ASCII codes of these are 32 through 126. If the shifted code goes outside of this range, it should wrap around. For example, if we shift ~ by 1, the result should be space. If we shift space by -1, the result should be ~. Here are a few things you may want to try with MATLAB before starting on this assignment:

```matlab
function coded = caesar(charvec, num)
    num = mod(num, 95);
    L = length(charvec);
    for i = 1 : L
        coded(i) = shift_single(charvec(i), num);
    end
end

function char_s = shift_single(char0, num)
    if (double(char0) + num) > 126
        char_s = char(double(char0) + num - 95);
    else
        char_s = char(double(char0) + num);
    end
end

caesar('ABCD',1)
ans =
    'BCDE'
caesar('xyz ~',1)
ans =
    'yz{! '
caesar('xyz ~',-1)
ans =
    'wxy~}'
```

- **Sparse Matrix**

A sparse matrix is a large matrix with almost all elements of the same value (typically zero). The normal representation of a sparse matrix takes up lots of memory when the useful information can be captured with much less. A possible way to represent a sparse matrix is with a cell vector whose **first element is a 2-element vector representing the size of the sparse matrix**. The second element is a scalar specifying **the default value of the sparse matrix**. Each successive element of the cell vector is a 3-element vector representing **one element of the sparse matrix that has a value other than the default**. The three elements are the row index, the column index and the actual value. Write a function called **sparse2matrix** that takes a single input of a cell vector as defined above and returns the output argument called **matrix**, the matrix in its traditional form. Consider the following run:

```matlab
function matrix = sparse2matrix(cellvec)
    matrix = zeros(cellvec{1}) + cellvec{2};
    for i = 1:(length(cellvec)-2)
        matrix(cellvec{i+2}(1), cellvec{i+2}(2)) = cellvec{i+2}(3);
    end
end

cellvec = {[2 3], 0, [1 2 3], [2 2 -3]};
matrix = sparse2matrix(cellvec)
matrix =
     0     3     0
     0    -3     0
```

### Lesson 8

#### lesson8.2

```
[num,txt,raw] = xlsread('myExample.xlsx')
num: 数字，文本为NaN
txt: 元胞数组文本
raw: 元胞数组所有
xlswrite
fid = fopen(filename, permission); % permit: read, write, overwrite,append 'rt', 'wt', 'at'
fclose(fid);
```

#### exciese

- Excel File I/O

The attached **Distances.xlsx** file contains a spreadsheet with **the pairwise distances in miles of the top 100 US cities by population**. A preview of the spreadsheet is shown below. The first row and first column contain the city names using the following format: **city name comma space capitalized state abbreviation**, e.g., Nashville, TN. Note that the very first cell of the spresheet, **A1, is blank**. 
Write a function called **get_distance** that **accepts two character vector inputs representing the names of two cities**. The function returns the distance between them as **an output argument called distance**. For example, the call `get_distance('Seattle, WA','Miami, FL')` should return 3723. If one or both of the specified cities **are not in the file, the function returns -1**.
Preview of the first five cities of Distances.xlsx 

![week9_ex1](.\week9_ex1.png)

```matlab
function distance = get_distance(cityA, cityB)
    xlRange = 'A2:A337'; % 用于读取范围SizeDist = size(dist) 336 * 336
    [~, cityCell, ~] = xlsread('Distances.xlsx', xlRange);
    cA = strcmp(cityCell, cityA); % logical array
    cB = strcmp(cityCell, cityB); % logical array
    indexA = find(cA==1); 
    indexB = find(cB==1);
    if isempty(indexA) || isempty(indexB)
         distance = -1;
    else
        dist = xlsread('Distances.xlsx');
        distance = dist(indexA, indexB);
    end
end

distance = get_distance('Seattle, WA','Miami, FL')
distance =
        3723
```

- **Text File I/O**

Write a function called **char_counter** that counts the number of a certain character in a text file. The function takes two input arguments, **fname**, a char vector of the filename and **character**, the char it counts in the file. The function returns **charnum**, the number of characters found. If the file is not found or **character** is not a valid char, the function return -1. As an example, consider the following run. The file "simple.txt" contains a single line: "This file should have exactly three a-s..."

```matlab
function charnum = char_counter(fname, character)
    if exist(fname,'file') == 2 % 文件标识为2
        if ischar(character) == 1
            fid = fopen(fname, 'r');
            [content,length] = fread(fid);
            charnum = 0;
            for i = 1 : length
                if(content(i) == character)
                    charnum = charnum + 1;
                end
            end
            fclose(fid);
        else
            charnum = -1;
        end
    else
        charnum = -1;
    end
end

charnum = char_counter('simple.txt','a')
charnum = 
   3
```

You may find it helpful to download the files for testing and dubugging in MATLAB. [simple.txt](https://lcms-files.mathworks.com/content/file/bf0e8826-41ed-4aab-9100-f04e5c0862c0/simple.txt?versionId=u4zDMOU.p96MIJrr4Hc6FEzZNMeNPaaS), [Frankenstein-by-Shelley.txt](https://lcms-files.mathworks.com/content/file/be4c8d60-482e-48d0-ac10-1ad8edde1926/Frankenstein-by-Shelley.txt?versionId=mauzCyRrdgZWDGf3FOuv8FrDcOdBw8dD)

### Final problem

- **Saddle Points**

Write a function called **saddle** that finds saddle points in the input matrix **M**. For the purposes of this problem, a saddle point is defined as an element whose value is greater than or equal to every element in its row, and less than or equal to every element in its column. Note that there may be more than one saddle point in **M**. Return a matrix called **indices** that has exactly two columns. Each row of indices corresponds to one saddle point with the first element of the row containing the row index of the saddle point and the second element containing the column index. If there is no saddle point in **M**, then **indices** is the empty array.

```matlab
% original problem
% create an interesting surface
[X,Y] = meshgrid(-15:0.5:10,-10:0.5:10);
Z = (X.^2-Y.^2)';
% find saddle points
indices = saddle(Z)
% plot surface
surf(Z);
hold on
% mark saddle points with red dots in the same figure
for ii = 1:size(indices,1)
    h = scatter3(indices(ii,2),indices(ii,1),Z(indices(ii,1),indices(ii,2)),'red','filled');
    h.SizeData = 120;
end
% adjust viewpoint
view(-115,14);
hold off

function indices = saddle(M)
    indices = [];
    [row, col] = size(M);
    for i=1:col
        for j=1:row
            minM = min(M(:, i));  % min in col
            maxM = max(M(j, :));  % max in row
            if M(j, i) == minM && minM == maxM 
                indices = [indices; [j i]];
            end
        end
    end
end
```

- **Image Blur** 图片模糊化

Write a function called blur that blurs the input image. The function is to be called like this: `output = blur(img,w);`

where **img**, the input image is a two-dimensional matrix of grayscale pixel values between 0 and 255. Blurring is to be carried out by averaging the pixel values in the vicinity of every pixel. Specifically, the output pixel value is the mean of the pixels in a square submatrix of size **2w+1** where the given pixel sits in the center. For example, if **w** is 1, then we use a 3x3 matrix, that is, we average all the neighboring pixels of the given pixel and itself. Only use valid pixels when portions of the blurring matrix fall outside the image. For example, the blurred value corresponding to **w = 1** at index (1,1) would be the mean of of elements (1,1), (1, 2), (2,1) and (2, 2). Both input **img** and output **output** are of type **uint8**.

You can download the [test image here](https://lcms-files.mathworks.com/content/file/686b475c-bd78-497d-b971-b583832bbf23/vandy.png?versionId=ZUe0hS9J3ZIxKapgDPNMdw_Uvjotsiaf) to use in MATLAB.

```matlab
% original problem
img = imread('vandy.png');
output = blur(img,2);
imshow(output);

function output = blur(img, w)
    [row,col] = size(img); % 395, 340
    % initialization
    imgSpace = ones([row + 2 * w, col + 2 * w]) * 256;
    % copy img
    imgSpace(w + 1 : w + row, w + 1 : w + col) = img;
    imgMap = (imgSpace < 256).*imgSpace; % 中间不变，周围置0
    for indexX = w + 1 : w + row
    	for indexY = w + 1 : w + col
    		inImg = 0;
    		output((indexX - w), (indexY - w)) = sum(sum(imgMap(indexX - w : indexX + w, indexY - w : indexY + w)));
    		inImg = sum(sum(imgSpace(indexX - w: indexX + w, indexY - w: indexY + w) < 256));
    		output((indexX - w), (indexY - w)) = output((indexX - w), (indexY - w)) / inImg;
		end
	end
    output = uint8(output);
end
```

- **Echo Generator**

Write a function called echo_gen that adds an echo effect to an audio recording. The function is to be called like this: `output = echo_gen(input, fs, delay, amp);`

where input is a column vector with values **between -1 and 1 representing a time series of digitized sound data**. The input argument fs is the sampling rate. The sampling rate specifies how many samples we have in the data each second. For example, **an audio CD uses 44,100 samples per second**. The input argument delay represent the delay of the echo in seconds. That is, the echo should start after delay seconds have passed from the start of the audio signal. Finally, amp specifies **the amplification of the echo which normally should be a value less than 1**, since the echo is typically not as loud as the original signal. 

The output of the function is a column vector containing the original sound with the echo superimposed. The output vector will be longer than the input vector if the delay is not zero (round to the nearest number of points needed to get the delay, as opposed to floor or ceil). **A sound recording has values between -1 and 1, so if the echo causes some values to be outside of this range**, you will need to normalize the entire vector, so that all values adhere to this requirement. 

MATLAB has several sample audio files included that you can try: splat, gong, and handel are a few examples. Try the following:

```matlab
load gong % loads two variables, y and Fs
sound(y, Fs) % Outputs sound
```

To hear the sound you will need to use desktop MATLAB or MATLAB Online.
(Note that we are assuming mono audiofiles. You can load your own audio files using the audioread function in MATLAB. If the audio data has two columns, it is a stereo file, so use only one column of the data when testing your file.)

```matlab
function output = echo_gen(input, fs, delay, amp)
	addSamples = round(fs * delay);
    if addSamples > 0
        addAudio = zeros(addSamples, 1);
    else
        addAudio = [];
    end
    echoAudio = amp * input;
    echoAll = [addAudio; echoAudio];
    audio = [input ; addAudio];
    out = audio + echoAll;
    if max(out)>1
        output=out/max(out);
    else
        output=out;
    end
end
```

https://github.com/adithyar262/Introduction-to-Programming-with-MATLAB-solutions-

