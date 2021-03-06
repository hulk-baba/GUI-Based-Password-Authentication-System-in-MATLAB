function varargout = axis(varargin)
% AXIS MATLAB code for axis.fig
%      AXIS, by itself, creates a new AXIS or raises the existing
%      singleton*.
%
%      H = AXIS returns the handle to a new AXIS or the handle to
%      the existing singleton*.
%
%      AXIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AXIS.M with the given input arguments.
%
%      AXIS('Property','Value',...) creates a new AXIS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before axis_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to axis_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help axis

% Last Modified by GUIDE v2.5 09-Apr-2016 10:53:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @axis_OpeningFcn, ...
                   'gui_OutputFcn',  @axis_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before axis is made visible.
function axis_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to axis (see VARARGIN)

% Choose default command line output for axis
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes axis wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = axis_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
set(handles.finish,'Enable','off');
dbname = 'DBMS';
username = 'root';
password = '123';
driver = 'com.mysql.jdbc.Driver';
dburl = ['jdbc:mysql://localhost:3306/' dbname];
conn = database(dbname,username,password,driver,dburl);
a=imread('i1.jpg');
%image(a);
%f=figure(1);
for i=1:9
    j=num2str(i);
    sqlquery = 'select * from IMAGES where image_id=';
    s=strcat(sqlquery,j);
    curs = exec(conn,s);
    curs = fetch(curs);
    x1=curs.Data;
    x1,
    z=x1(3);
    a=cell2mat(z);
    im=imread(a);
    subplot(3,3,i);
    imshow(im);
   % ButtonH=uicontrol('f','Style','pushbutton','String','View Data','Units','normalized','Position',[0.60 0.10 0.500 0.500],'Visible','on');
end
 %ButtonH=uicontrol('f','Style','pushbutton','String','View Data','Units','normalized','Position',[0.60 0.10 0.500 0.500],'Visible','on');
close(curs);
close(conn);
%aa=getappdata(0,'f_state');
%set(handles.finish,'Enable',aa);


% --- Executes on button press in i1.
function i1_Callback(hObject, eventdata, handles)
% hObject    handle to i1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
count_select=getappdata(0,'c_s');
 count_select=count_select+1;
 setappdata(0,'c_s',count_select);
 aaa=getappdata(0,'c_s');
if count_select==4
   
    set(handles.i1,'Enable','off');
    set(handles.i2,'Enable','off');
    set(handles.i3,'Enable','off');
    set(handles.i4,'Enable','off');
    set(handles.i5,'Enable','off');
    set(handles.i6,'Enable','off');
    set(handles.i7,'Enable','off');
    set(handles.i8,'Enable','off');
    set(handles.i9,'Enable','off');
    set(handles.finish,'Enable','on');
end
im=imread('i1.jpg');
figure(1),
image(im);
[p2,p3]=ginput(1);
[x,y]=size(im);
if floor(p2-50)<0 || floor(p2+50)>x || floor(p3-50)<0 || floor(p3+50)>y
    s='select another region';
    disp(s);
    [p2,p3]=ginput(1);
end
 
sp5(1) = floor(p2-50); %xmin
sp5(2) = floor(p3-50); %ymin
sp5(3) = ceil(p2+50);   %xmax
sp5(4) = ceil(p3+50);   %ymax
MM = im(sp5(2):sp5(4), sp5(1): sp5(3),:);
subplot(3,2,1:4);
imshow(im);
subplot(3,2,6);
imshow(MM);
p1='1',
p2=floor(p2),
p2=num2str(p2)
p3=floor(p3),
p3=num2str(p3),
aa=getappdata(0,'img');
bb=getappdata(0,'x');
cc=getappdata(0,'y');
aa=strcat(p1,aa),
bb=strcat(p2,bb),
cc=strcat(p3,cc),
setappdata(0,'img',aa);
setappdata(0,'x',bb);
setappdata(0,'y',cc);
pause(1);
close(gcf);
%if  dd ~= 0;
%    setappdata(0,'f_state','on');
%    aa=getappdata(0,'f_state');
%    set(handles.finish,'Enable',aa);
%end
% --- Executes on button press in i2.
function i2_Callback(hObject, eventdata, handles)
% hObject    handle to i2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
count_select=getappdata(0,'c_s');
 count_select=count_select+1;
 setappdata(0,'c_s',count_select);
 aaa=getappdata(0,'c_s');
if count_select==4
   
    set(handles.i1,'Enable','off');
    set(handles.i2,'Enable','off');
    set(handles.i3,'Enable','off');
    set(handles.i4,'Enable','off');
    set(handles.i5,'Enable','off');
    set(handles.i6,'Enable','off');
    set(handles.i7,'Enable','off');
    set(handles.i8,'Enable','off');
    set(handles.i9,'Enable','off');
    set(handles.finish,'Enable','on');
end
im=imread('i2.jpg');
figure(1),
image(im);
[p2,p3]=ginput(1);
[x,y]=size(im);
if floor(p2-50)<0 || floor(p2+50)>x || floor(p3-50)<0 || floor(p3+50)>y
    s='select another region';
    disp(s);
    [p2,p3]=ginput(1);
end
 
sp5(1) = floor(p2-50); %xmin
sp5(2) = floor(p3-50); %ymin
sp5(3) = ceil(p2+50);   %xmax
sp5(4) = ceil(p3+50);   %ymax
MM = im(sp5(2):sp5(4), sp5(1): sp5(3),:);
subplot(3,2,1:4);
imshow(im);
subplot(3,2,6);
imshow(MM);
p1='2',
p2=floor(p2),
p2=num2str(p2)
p3=floor(p3),
p3=num2str(p3),
aa=getappdata(0,'img');
bb=getappdata(0,'x');
cc=getappdata(0,'y');
aa=strcat(p1,aa),
bb=strcat(p2,bb),
cc=strcat(p3,cc),
setappdata(0,'img',aa);
setappdata(0,'x',bb);
setappdata(0,'y',cc);
pause(1);
close(gcf);
% --- Executes on button press in i3.
function i3_Callback(hObject, eventdata, handles)
% hObject    handle to i3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
count_select=getappdata(0,'c_s');
 count_select=count_select+1;
 setappdata(0,'c_s',count_select);
 aaa=getappdata(0,'c_s');
if count_select==4
   
    set(handles.i1,'Enable','off');
    set(handles.i2,'Enable','off');
    set(handles.i3,'Enable','off');
    set(handles.i4,'Enable','off');
    set(handles.i5,'Enable','off');
    set(handles.i6,'Enable','off');
    set(handles.i7,'Enable','off');
    set(handles.i8,'Enable','off');
    set(handles.i9,'Enable','off');
    set(handles.finish,'Enable','on');
end
im=imread('i3.jpg');
figure(1),
image(im);
[p2,p3]=ginput(1);
[x,y]=size(im);
if floor(p2-50)<0 || floor(p2+50)>x || floor(p3-50)<0 || floor(p3+50)>y
    s='select another region';
    disp(s);
    [p2,p3]=ginput(1);
end
 
sp5(1) = floor(p2-50); %xmin
sp5(2) = floor(p3-50); %ymin
sp5(3) = ceil(p2+50);   %xmax
sp5(4) = ceil(p3+50);   %ymax
MM = im(sp5(2):sp5(4), sp5(1): sp5(3),:);
subplot(3,2,1:4);
imshow(im);
subplot(3,2,6);
imshow(MM);
p1='3',
p2=floor(p2),
p2=num2str(p2)
p3=floor(p3),
p3=num2str(p3),
aa=getappdata(0,'img');
bb=getappdata(0,'x');
cc=getappdata(0,'y');
aa=strcat(p1,aa),
bb=strcat(p2,bb),
cc=strcat(p3,cc),
setappdata(0,'img',aa);
setappdata(0,'x',bb);
setappdata(0,'y',cc);
pause(1);
close(gcf);

% --- Executes on button press in i4.
function i4_Callback(hObject, eventdata, handles)
% hObject    handle to i4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
count_select=getappdata(0,'c_s');
 count_select=count_select+1;
 setappdata(0,'c_s',count_select);
 aaa=getappdata(0,'c_s');
if count_select==4
   
    set(handles.i1,'Enable','off');
    set(handles.i2,'Enable','off');
    set(handles.i3,'Enable','off');
    set(handles.i4,'Enable','off');
    set(handles.i5,'Enable','off');
    set(handles.i6,'Enable','off');
    set(handles.i7,'Enable','off');
    set(handles.i8,'Enable','off');
    set(handles.i9,'Enable','off');
    set(handles.finish,'Enable','on');
end
im=imread('i4.jpg');
figure(1),
image(im);
[p2,p3]=ginput(1);
[x,y]=size(im);
if floor(p2-50)<0 || floor(p2+50)>x || floor(p3-50)<0 || floor(p3+50)>y
    s='select another region';
    disp(s);
    [p2,p3]=ginput(1);
end
 
sp5(1) = floor(p2-50); %xmin
sp5(2) = floor(p3-50); %ymin
sp5(3) = ceil(p2+50);   %xmax
sp5(4) = ceil(p3+50);   %ymax
MM = im(sp5(2):sp5(4), sp5(1): sp5(3),:);
subplot(3,2,1:4);
imshow(im);
subplot(3,2,6);
imshow(MM);
p1='4',
p2=floor(p2),
p2=num2str(p2)
p3=floor(p3),
p3=num2str(p3),
aa=getappdata(0,'img');
bb=getappdata(0,'x');
cc=getappdata(0,'y');
aa=strcat(p1,aa),
bb=strcat(p2,bb),
cc=strcat(p3,cc),
setappdata(0,'img',aa);
setappdata(0,'x',bb);
setappdata(0,'y',cc);
pause(1);
close(gcf);

% --- Executes on button press in i5.
function i5_Callback(hObject, eventdata, handles)
% hObject    handle to i5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
count_select=getappdata(0,'c_s');
 count_select=count_select+1;
 setappdata(0,'c_s',count_select);
 aaa=getappdata(0,'c_s');
if count_select==4
   
    set(handles.i1,'Enable','off');
    set(handles.i2,'Enable','off');
    set(handles.i3,'Enable','off');
    set(handles.i4,'Enable','off');
    set(handles.i5,'Enable','off');
    set(handles.i6,'Enable','off');
    set(handles.i7,'Enable','off');
    set(handles.i8,'Enable','off');
    set(handles.i9,'Enable','off');
    set(handles.finish,'Enable','on');
end
im=imread('i5.jpg');
figure(1),
image(im);
[p2,p3]=ginput(1);
[x,y]=size(im);
if floor(p2-50)<0 || floor(p2+50)>x || floor(p3-50)<0 || floor(p3+50)>y
    s='select another region';
    disp(s);
    [p2,p3]=ginput(1);
end
 
sp5(1) = floor(p2-50); %xmin
sp5(2) = floor(p3-50); %ymin
sp5(3) = ceil(p2+50);   %xmax
sp5(4) = ceil(p3+50);   %ymax
MM = im(sp5(2):sp5(4), sp5(1): sp5(3),:);
subplot(3,2,1:4);
imshow(im);
subplot(3,2,6);
imshow(MM);
p1='5',
p2=floor(p2),
p2=num2str(p2)
p3=floor(p3),
p3=num2str(p3),
aa=getappdata(0,'img');
bb=getappdata(0,'x');
cc=getappdata(0,'y');
aa=strcat(p1,aa),
bb=strcat(p2,bb),
cc=strcat(p3,cc),
setappdata(0,'img',aa);
setappdata(0,'x',bb);
setappdata(0,'y',cc);
pause(1);
close(gcf);

% --- Executes on button press in i6.
function i6_Callback(hObject, eventdata, handles)
% hObject    handle to i6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
count_select=getappdata(0,'c_s');
 count_select=count_select+1;
 setappdata(0,'c_s',count_select);
 aaa=getappdata(0,'c_s');
if count_select==4
   
    set(handles.i1,'Enable','off');
    set(handles.i2,'Enable','off');
    set(handles.i3,'Enable','off');
    set(handles.i4,'Enable','off');
    set(handles.i5,'Enable','off');
    set(handles.i6,'Enable','off');
    set(handles.i7,'Enable','off');
    set(handles.i8,'Enable','off');
    set(handles.i9,'Enable','off');
    set(handles.finish,'Enable','on');
end
im=imread('i6.jpg');
figure(1),
image(im);
[p2,p3]=ginput(1);
[x,y]=size(im);
if floor(p2-50)<0 || floor(p2+50)>x || floor(p3-50)<0 || floor(p3+50)>y
    s='select another region';
    disp(s);
    [p2,p3]=ginput(1);
end
 
sp5(1) = floor(p2-50); %xmin
sp5(2) = floor(p3-50); %ymin
sp5(3) = ceil(p2+50);   %xmax
sp5(4) = ceil(p3+50);   %ymax
MM = im(sp5(2):sp5(4), sp5(1): sp5(3),:);
subplot(3,2,1:4);
imshow(im);
subplot(3,2,6);
imshow(MM);
p1='6',
p2=floor(p2),
p2=num2str(p2)
p3=floor(p3),
p3=num2str(p3),
aa=getappdata(0,'img');
bb=getappdata(0,'x');
cc=getappdata(0,'y');
aa=strcat(p1,aa),
bb=strcat(p2,bb),
cc=strcat(p3,cc),
setappdata(0,'img',aa);
setappdata(0,'x',bb);
setappdata(0,'y',cc);
pause(1);
close(gcf);

% --- Executes on button press in i7.
function i7_Callback(hObject, eventdata, handles)
% hObject    handle to i7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
count_select=getappdata(0,'c_s');
 count_select=count_select+1;
 setappdata(0,'c_s',count_select);
 aaa=getappdata(0,'c_s');
if count_select==4
   
    set(handles.i1,'Enable','off');
    set(handles.i2,'Enable','off');
    set(handles.i3,'Enable','off');
    set(handles.i4,'Enable','off');
    set(handles.i5,'Enable','off');
    set(handles.i6,'Enable','off');
    set(handles.i7,'Enable','off');
    set(handles.i8,'Enable','off');
    set(handles.i9,'Enable','off');
    set(handles.finish,'Enable','on');
end
im=imread('i7.jpg');
figure(1),
image(im);
[p2,p3]=ginput(1);
[x,y]=size(im);
if floor(p2-50)<0 || floor(p2+50)>x || floor(p3-50)<0 || floor(p3+50)>y
    s='select another region';
    disp(s);
    [p2,p3]=ginput(1);
end
 
sp5(1) = floor(p2-50); %xmin
sp5(2) = floor(p3-50); %ymin
sp5(3) = ceil(p2+50);   %xmax
sp5(4) = ceil(p3+50);   %ymax
MM = im(sp5(2):sp5(4), sp5(1): sp5(3),:);
subplot(3,2,1:4);
imshow(im);
subplot(3,2,6);
imshow(MM);
p1='7',
p2=floor(p2),
p2=num2str(p2)
p3=floor(p3),
p3=num2str(p3),
aa=getappdata(0,'img');
bb=getappdata(0,'x');
cc=getappdata(0,'y');
aa=strcat(p1,aa),
bb=strcat(p2,bb),
cc=strcat(p3,cc),
setappdata(0,'img',aa);
setappdata(0,'x',bb);
setappdata(0,'y',cc);
pause(1);
close(gcf);

% --- Executes on button press in i8.
function i8_Callback(hObject, eventdata, handles)
% hObject    handle to i8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
count_select=getappdata(0,'c_s');
 count_select=count_select+1;
 setappdata(0,'c_s',count_select);
 aaa=getappdata(0,'c_s');
if count_select==4
   
    set(handles.i1,'Enable','off');
    set(handles.i2,'Enable','off');
    set(handles.i3,'Enable','off');
    set(handles.i4,'Enable','off');
    set(handles.i5,'Enable','off');
    set(handles.i6,'Enable','off');
    set(handles.i7,'Enable','off');
    set(handles.i8,'Enable','off');
    set(handles.i9,'Enable','off');
    set(handles.finish,'Enable','on');
end
im=imread('i8.jpg');
figure(1),
image(im);
[p2,p3]=ginput(1);
[x,y]=size(im);
if floor(p2-50)<0 || floor(p2+50)>x || floor(p3-50)<0 || floor(p3+50)>y
    s='select another region';
    disp(s);
    [p2,p3]=ginput(1);
end
 
sp5(1) = floor(p2-50); %xmin
sp5(2) = floor(p3-50); %ymin
sp5(3) = ceil(p2+50);   %xmax
sp5(4) = ceil(p3+50);   %ymax
MM = im(sp5(2):sp5(4), sp5(1): sp5(3),:);
subplot(3,2,1:4);
imshow(im);
subplot(3,2,6);
imshow(MM);
p1='8',
p2=floor(p2),
p2=num2str(p2)
p3=floor(p3),
p3=num2str(p3),
aa=getappdata(0,'img');
bb=getappdata(0,'x');
cc=getappdata(0,'y');
aa=strcat(p1,aa),
bb=strcat(p2,bb),
cc=strcat(p3,cc),
setappdata(0,'img',aa);
setappdata(0,'x',bb);
setappdata(0,'y',cc);
pause(1);
close(gcf);

% --- Executes on button press in i9.
function i9_Callback(hObject, eventdata, handles)
% hObject    handle to i9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
count_select=getappdata(0,'c_s');
 count_select=count_select+1;
 setappdata(0,'c_s',count_select);
 aaa=getappdata(0,'c_s');
if count_select==4
   
    set(handles.i1,'Enable','off');
    set(handles.i2,'Enable','off');
    set(handles.i3,'Enable','off');
    set(handles.i4,'Enable','off');
    set(handles.i5,'Enable','off');
    set(handles.i6,'Enable','off');
    set(handles.i7,'Enable','off');
    set(handles.i8,'Enable','off');
    set(handles.i9,'Enable','off');
    set(handles.finish,'Enable','on');
end
im=imread('i9.jpg');
figure(1),
image(im);
[p2,p3]=ginput(1);
[x,y]=size(im);
if floor(p2-50)<0 || floor(p2+50)>x || floor(p3-50)<0 || floor(p3+50)>y
    s='select another region';
    disp(s);
    [p2,p3]=ginput(1);
end
 
sp5(1) = floor(p2-50); %xmin
sp5(2) = floor(p3-50); %ymin
sp5(3) = ceil(p2+50);   %xmax
sp5(4) = ceil(p3+50);   %ymax
MM = im(sp5(2):sp5(4), sp5(1): sp5(3),:);
subplot(3,2,1:4);
imshow(im);
subplot(3,2,6);
imshow(MM);
p1='9',
p2=floor(p2),
p2=num2str(p2)
p3=floor(p3),
p3=num2str(p3),
aa=getappdata(0,'img');
bb=getappdata(0,'x');
cc=getappdata(0,'y');
aa=strcat(p1,aa),
bb=strcat(p2,bb),
cc=strcat(p3,cc),
setappdata(0,'img',aa);
setappdata(0,'x',bb);
setappdata(0,'y',cc);
pause(1);
close(gcf);
% --- Executes on button press in view_pass.
function view_pass_Callback(hObject, eventdata, handles)
% hObject    handle to view_pass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in finish.
function finish_Callback(hObject, eventdata, handles)
% hObject    handle to finish (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'state','off');
%a=getappdata(0,'state');
setappdata(0,'s_state','on');
setappdata(0,'n_state','off');
close(axis);
run(sign_up);