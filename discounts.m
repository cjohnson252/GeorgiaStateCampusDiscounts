% discounts.m
%
% Authors: Caroline Johnson, Shena Cao
% CSC 4630 Final Project
% Fall 2016
% 
% Description: This program allows users to select a Georgia State main
% campus building from a dropdown and will display a table of the discounts
% that are near them (within a defined distance). Alternatively, they can
% select a building from a map of campus.
%
% Input: This program uses the Matlab GUI, and thus users can click items
% in the UI as input.
%
% Output: This program displays a figure with a dropdown containing
% different campus buildings and will display a table of discounts
% depending on the building selected. It will also display a map that users
% can select from if they click the button for it.
%
% Usage: Call discounts from the command window.

function[] = discounts()

% Define the maximum distance that defines which discounts are near which
% buildings.
maxDistance = 2;

% Define the buildings on campus as cell arrays in the format
% {name, x-coordinate, y-coordinate}.
arts = {'Arts and Humanities', 5, 5};
adh = {'Aderhold Learning Center', 2, 8};
clso = {'Classroom South', 4, 3};
rcb = {'College of Business', 1, 6};
coe = {'College of Education', 2, 4};
law = {'College of Law', 4, 8};
dahl = {'Dahlberg Hall', 2, 5};
pp55 = {'Fifty-Five Park Place', 4, 7};
haas = {'Haas-Howell Building', 2, 8};
hc = {'Honors College', 8, 7};
kell = {'Kell Hall', 5, 4};
ldh = {'Langdale Hall', 4, 4};
libn = {'Library North', 5, 3};
libs = {'Library South', 5, 2};
nsc = {'Natural Science Center', 3, 4};
patt = {'Patton Hall', 9, 6};
piedc = {'Piedmont Central', 9, 8};
piedn = {'Piedmont North', 11, 11};
pp1 = {'One Park Place', 2, 5};
rec = {'Recreation Center', 7, 3};
rialto = {'Rialto Center', 2, 8};
sparks = {'Sparks Hall', 6, 4};
stctre = {'Student Center East', 7, 3};
stctrw = {'Student Center West', 6, 3};
pp25 = {'Twenty-Five Park Place', 4, 6};
book = {'University Bookstore', 6, 3};
comm = {'University Commons', 11, 10};
lofts = {'University Lofts', 8, 5};
ulb = {'Urban Life Building', 7, 2};

% Store the names of the buildings in a cell array for use in the dropdown
% menu. The first/default value will be to 'Select a Building'.
buildings = {'Select a Building', 'Arts and Humanities',...
    'Aderhold Learning Center', 'Classroom South', 'College of Business',...
    'College of Education', 'College of Law', 'Dahlberg Hall',...
    'Fifty-Five Park Place', 'Haas-Howell Building', 'Honors College',...
    'Kell Hall', 'Langdale Hall', 'Library North', 'Library South',...
    'Natural Science Center', 'Patton Hall', 'Piedmont Central',...
    'Piedmont North', 'One Park Place', 'Recreation Center',...
    'Rialto Center', 'Sparks Hall', 'Student Center East',...
    'Student Center West', 'Twenty-Five Park Place',...
    'University Bookstore', 'University Commons', 'University Lofts',...
    'Urban Life Building'};

% Define the locations of the discounts as arrays of the form
% [x-coordinate, y-coordinate], and store them in a cell array.
aamar = [2, 9];
ali = [2, 8];
anatolia = [2, 6];
ardens = [8, 7];
blossom = [2, 7];
chickfilaEast = [9, 2];
chickfilaWest = [6, 3];
dua = [2, 6];
dunkin = [2, 8];
ebrik = [3, 5];
grindhouse = [12, 5];
happy = [2, 6];
jimmy = [2, 8];
mangos = [10, 7];
moesEast = [10, 6];
moesWest = [2, 7];
naan = [2 ,7];
park = [4, 7];
pizza = [10, 6];
quiznosNorth = [2, 7];
quiznosSouth = [1, 6];
roly = [3, 5];
rubens = [2, 7];
saxbys = [5, 3];
sidebar = [2, 8];
sisters = [10, 7];
sivas = [3, 5];
slice = [10, 8];
subwayWest = [2, 7];
subwayEast = [10, 5];
waffleNorth = [7, 9];
waffleSouth = [6, 1]; 

locations = {aamar, ali, anatolia, ardens, blossom, chickfilaEast, ...
    chickfilaWest, dua, dunkin, ebrik, grindhouse, happy, jimmy, mangos,... 
    moesEast, moesWest, naan, park, pizza, quiznosNorth, quiznosSouth,... 
    roly, rubens, saxbys, sidebar, sisters, sivas, slice, subwayWest,... 
    subwayEast, waffleNorth, waffleSouth};

% Store the details of each discount as a multi-dimensional cell array in
% the same order as they are stored in locations above. This will be used
% as data for the uitable.
tableData = {'Aamar Indian', '20% student discount', '100 Luckie St NW';...
    'Ali Baba Mediterranean', '$19 dinner for two', '60 Broad St NW';... 
    'Anatolia Cafe', '10% student discount', '52 Peachtree St NW';... 
    'Ardens Garden', '10% student discount', '145 Auburn Ave NE';...
    'Blossom Tree', '10% student discount', '64 Peachtree St NW';...
    'Chick-fil-a', 'free small drink for students',...
    '80 Jesse Hill Jr Dr SE'; 'Chick-fil-a',...
    'free small drink for students', '66 Courtland St NE';...
    'Dua Vietnamese', '15% student discount', '53 Broad St NW';...
    'Dunkin Doughnuts', '10% student discount', '98 Forsyth St NW';...
    'Ebrik Cafe', '5% student discount', '16 Park Pl SE';...
    'Grindhouse Burgers', '15% student discount', '209 Edgewood Ave SE';...
    'Happy Hooka', '15% student discount', '66 Peachtree St NW';...
    'Jimmy Johns', '10% student discount', '60 Luckie St NW';...
    'Mangos Carribean', '$6.99 lunch special', '180 Auburn Ave NE';...
    'Moes', '$5 burrito Monday', '171 Auburn Ave NE'; 'Moes',...
    '$5 burrito Monday', '70 Peachtree St NE'; 'NaanStop',...
    '10% student discount', '64 Broad St NW'; 'Park Place Deli',...
    '$5 lunch', '55 Park Pl NE'; 'Pizza Hut', '10% student discount',...
    '25 Piedmont Ave NE'; 'Quiznos', '20% student discount',...
    '138 Peachtree St NE'; 'Quiznos', '20% student discount',...
    '29 Marietta St NW'; 'Roly Poly', '10% student discount',...
    '8 Park Pl S'; 'Rubens Deli', '$5 sandwich and salad',...
    '57 Broad St NW'; 'Saxbys Coffee', '15% student discount',...
    '100 Decatur St SE'; 'Sidebar', 'half-price happy hour drinks',...
    '79 Poplar St NW'; 'Sisters of the New South', '15% student discount',...
    '27 Piedmont Ave NE'; 'Sivas Express', '$5 breakfast',...
    '17 Hurt Plaza SE'; 'Slice', '$5.99 slice and salad',...
    '85 Poplar St NW'; 'Subway', '$5 sub of the day', '68 Broad St NW';...
    'Subway', '$5 sub of the day', '183 Edgewood Ave NE'; 'Waffle House',...
    '10% student discount', '112 Courtland St NE'; 'Waffle House',...
    '10% student discount', '100 Piedmont Ave SE'};

% Create a dropdown menu that stores and displays the cell array of
% buildings and call the menucallback function everytime a new building is
% selected.
menu = uicontrol('Style', 'popupmenu', 'String', buildings, 'Value', 1,...
    'Position', [200 200 200 200], 'Callback', @menuCallback);

% Create a button that allows you to use the map view to select a building.
mapButton = uicontrol('String', 'Click to View Map', 'Position',...
    [20 20 100 20], 'Callback', @mapDisplay);

% Display text that there are 'No Results' when that is the case.
text = uicontrol('Style', 'text', 'Position', [200 350 200 20],...
    'String', 'No Results');

% Create a uitable to show the discounts for each location.
table = uitable('Position', [80 300 438 38],...
    'ColumnName', {'Business', 'Discount', 'Address'}, 'ColumnWidth',...
    {132, 133, 132}, 'Enable', 'inactive', 'Visible', 'off');


    % This is the callback function for the dropdown menu.
    function menuCallback(object, ~)
        % val is the currently selected value, which is the index of the
        % selected building in the buildings cell array.
        val = get(object, 'Value');
        % Use the val to update the table for the selected building.
        setKey(val);
    end

    % This function takes the index of the selected building and updates
    % the data table as needed.
    function setKey(val)
        % Initialize the key to a default value.
        key = {'No Results', 0, 0};
        % Set the value of key to correspond with the correct building
        % based on the index provided.
        switch val
            case 2
                key = arts;
            case 3
                key = adh;
            case 4
                key = clso;
            case 5
                key = rcb;
            case 6
                key = coe;
            case 7
                key = law;
            case 8
                key = dahl;
            case 9
                key = pp55;
            case 10
                key = haas;
            case 11
                key = hc;
            case 12
                key = kell;
            case 13
                key = ldh;
            case 14
                key = libn;
            case 15
                key = libs;
            case 16
                key = nsc;
            case 17
                key = patt;
            case 18
                key = piedc;
            case 19
                key = piedn;
            case 20
                key = pp1;
            case 21
                key = rec;
            case 22
                key = rialto;
            case 23
                key = sparks;
            case 24
                key = stctre;
            case 25
                key = stctrw;
            case 26
                key = pp25;
            case 27
                key = book;
            case 28
                key = comm;
            case 29
                key = lofts;
            case 30
                key = ulb;
        end
        % Set the text UI to the first value of the key.
        set(text, 'String', key{1});
        % If an actual building is selected from the dropdown, update the
        % table UI. Otherwise hide the table and set the data to be empty.
        if ~strcmp(key(1), 'No Results')
            set(text, 'String', '');
            getTable(key)
        else
            set(table, 'Visible', 'off');
            set(table, 'Data', {});
        end
    end

    % This function will update the table UI based on the selected
    % building.
    function getTable(building)
        % nearby will be the data in the table.
        nearby = tableData;
        locationSize = size(locations);
        locationSize = locationSize(2);
        rowsToDelete = [];
        i = 1;
        % Loop through the discount locations and check the distance 
        % between each location and the selected building.
        for j = 1:locationSize
            discount = locations(j);
            discount = discount{1,1};
            % If the distance between the building and the discount is not
            % less than or equal to the minimum distance, add that discount
            % to the rowsToDelete array to remove it from the data.
            if getDistance(building, discount) > maxDistance
                rowsToDelete(i) = j;
                % Increment i to traverse the rowsToDelete array.
                i = i + 1;
            end
        end
        
        deleteSize = size(rowsToDelete);
        deleteSize = deleteSize(2);
        % Remove each of the specified rows from the data.
        for k = deleteSize:-1:1
            x = rowsToDelete(k);
            nearby(x,:) = [];
        end
        
        % If not all rows were deleted, update the data table with the new
        % data and display it. Otherwise, clear the table and hide it, and
        % display the 'No Results' text.
        if deleteSize ~= locationSize
            numRows = locationSize - deleteSize;
            newHeight = 20 + (numRows*18);
            newBottom = 350 - (numRows*18);
            set(table, 'Position', [80 newBottom 438 newHeight]);
            set(table, 'Visible', 'on');
            set(table, 'Data', nearby);
            set(text, 'String', '');
        else
            set(table, 'Visible', 'off');
            set(table, 'Data', {});
            set(text, 'String', 'No Results');
        end
    end

    % This function returns the distance between the building and the 
    % discounts.
    function[d] = getDistance(building, discount)
        d = sqrt((discount(1)-building{2})^2 + (discount(2)-building{3})^2);
    end

    % This is the callback function for the display map button.
    function[] = mapDisplay(~, ~)
        % Create a new figure and display the map.
        figure();
        map = imread('map.png');
        imshow(map);
        title('Click on a Building or Click X to Select From Dropdown');
        
        % The following comments are the code used to determine the ranges
        % for each of the buildings.
        % data = impixelinfo;
        % set(data,'Position',[5 1 300 20]);
        
        % Loop until the user selects to exit the map view or they select a
        % building.
        index = 1;
        while index == 1
            [x, y] = ginput(1);
            if x > 730 && y > 1 && x < 800 && y < 70
                % If X is selected to close the map, do so and exit the
                % loop.
                close();
                index = -1;
                break;
            end
            
            % Ranges for each building were obtained from impixelinfo.
            if x > 240 && y > 352 && x < 280 && y < 375
                % Arts and Humanities
                index = 2;
                break;
            end
            if x > 98 && y > 191 && x < 126 && y < 237
                % Aderhold Learning Center
                index = 3;
                break;
            end
            if x > 176 && y > 438 && x < 215 && y < 467
                % Classroom South
                index = 4;
                break;
            end
            if x > 63 && y > 282 && x < 84 && y < 312
                % College of Business
                index = 5;
                break;
            end
            if x > 102 && y > 377 && x < 134 && y < 411
                % College of Education
                index = 6;
                break;
            end
            if x > 201 && y > 165 && x < 240 && y < 206
                % College of Law
                index = 7;
                break;
            end
            if x > 331 && y > 359 && x < 380 && y < 409
                % Dahlberg Hall
                index = 8;
                break;
            end
            if x > 198 && y > 221 && x < 239 && y < 254
                % Fifty-Five Park Place
                index = 9;
                break;
            end
            if x > 70 && y > 184 && x < 81 && y < 204
                % Haas-Howell Building
                index = 10;
                break;
            end
            if x > 392 && y > 228 && x < 429 && y < 252
                % Honors College
                index = 11;
                break;
            end
            if x > 222 && y > 376 && x < 255 && y < 408
                % Kell Hall
                index = 12;
                break;
            end
            if x > 202 && y > 396 && x < 235 && y < 429
                % Langdale Hall
                index = 13;
                break;
            end
            if x > 241 && y > 424 && x < 268 && y < 464
                % Library North
                index = 14;
                break;
            end
            if x > 218 && y > 464 && x < 245 && y < 487
                % Library South
                index = 15;
                break;
            end
            if x > 138 && y > 356 && x < 191 && y < 408
                % Natural Science Center
                index = 16;
                break;
            end
            if x > 449 && y > 299 && x < 478 && y < 329
                % Patton Hall
                index = 17;
                break;
            end
            if x > 424 && y > 167 && x < 475 && y < 197
                % Piedmont Central
                index = 18;
                break;
            end
            if x > 514 && y > 15 && x < 572 && y < 62
                % Piedmont North
                index = 19;
                break;
            end
            if x > 104 && y > 338 && x < 129 && y < 366
                % One Park Place
                index = 20;
                break;
            end
            if x > 347 && y > 461 && x < 382 && y < 556
                % Recreation Center
                index = 21;
                break;
            end
            if x > 83 && y > 171 && x < 104 && y < 190
                % Rialto Center
                index = 22;
                break;
            end
            if x > 266 && y > 379 && x < 299 && y < 428
                % Sparks Hall
                index = 23;
                break;
            end
            if x > 313 && y > 426 && x < 353 && y < 478
                % Student Center East
                index = 24;
                break;
            end
            if x > 266 && y > 443 && x < 296 && y < 484
                % Student Center West
                index = 25;
                break;
            end
            if x > 162 && y > 269 && x < 195 && y < 326
                % Twenty-Five Park Place
                index = 26;
                break;
            end
            if x > 290 && y > 432 && x < 308 && y < 453
                % University Bookstore
                index = 27;
                break;
            end
            if x > 481 && y > 83 && x < 580 && y < 143
                % University Commons
                index = 28;
                break;
            end
            if x > 379 && y > 337 && x < 417 && y < 373
                % University Lofts
                index = 29;
                break;
            end
            if x > 296 && y > 473 && x < 334 && y < 518
                % Urban Life Building
                index = 30;
                break;
            end
        end
        
        % If the user selects a building, close the map and update the
        % table and dropdown menu.
        if index ~= -1 && index ~= 1
            close();
            set(menu, 'Value', index);
            setKey(index);
        end
    end
end

