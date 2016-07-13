function varargout = new_log(varargin)
% NEW_LOG MATLAB code for new_log.fig
%      NEW_LOG, by itself, creates a new NEW_LOG or raises the existing
%      singleton*.
%
%      H = NEW_LOG returns the handle to a new NEW_LOG or the handle to
%      the existing singleton*.
%
%      NEW_LOG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEW_LOG.M with the given input arguments.
%
%      NEW_LOG('Property','Value',...) creates a new NEW_LOG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before new_log_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to new_log_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help new_log

% Last Modified by GUIDE v2.5 06-Apr-2016 21:53:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @new_log_OpeningFcn, ...
                   'gui_OutputFcn',  @new_log_OutputFcn, ...
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


% --- Executes just before new_log is made visible.
function new_log_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to new_log (see VARARGIN)

% Choose default command line output for new_log
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes new_log wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = new_log_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in next.
function next_Callback(hObject, eventdata, handles)
% hObject    handle to next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
l_id1=get(handles.user_id,'String'),
l_id2=l_id1,
flag=0;
dbname = 'DBMS';
username = 'root';
password = '123';
driver = 'com.mysql.jdbc.Driver';
dburl = ['jdbc:mysql://localhost:3306/' dbname];
conn = database(dbname,username,password,driver,dburl);    
d='''';
l_id1=strcat(d,l_id1),
l_id1=strcat(l_id1,d),
sqlquery = 'select * from PASSWORDS where user_id=';
l_id1=strcat(sqlquery,l_id1);
curs = exec(conn,l_id1);
curs = fetch(curs);
x1=curs.Data,
test=cell2mat(x1(1));
if strcmp(test,'No Data');
    z='';
else
    z=cell2mat(x1(2)),
end
asd=strcmp(z,l_id2);
if strcmp(z,l_id2);
    i_set= cell2mat(x1(3)),
    num_i=length(num2str(i_set));
    count=0;
    flag=1;
    x_set= cell2mat(x1(4)),
    y_set= cell2mat(x1(5)),
    i_count=0;
    while i_set~=0
       i_c=mod(i_set,10),
       i_c=floor(i_c),
       if flag==1 && count==i_count;
        zz=num2str(i_c),
       else
           num=rand()*8;
           num=num+1;
           num=floor(num);
           zz=num2str(num);
       end
       img_name=strcat('i',zz),
        s='.jpg',
        img_name=strcat(img_name,s),
        im=imread(img_name);
        figure(1),
        imshow(im);
        x_c=mod(x_set,1000),
        y_c=mod(y_set,1000),
        [p2,p3]=ginput(1);
        p2=floor(p2);
        p3=floor(p3);
        xmin = floor(x_c-50); %xmin
        ymin = floor(y_c-50); %ymin
        xmax = ceil(x_c+50);   %xmax
        ymax = ceil(y_c+50);  %ymax
        if  p2>xmin 
            if p2<xmax
                if p3>ymin
                    if p3<ymax
                        disp('jjs');
                        flag=1;
                        count=count+1;
                    else
                        flag=0;
                    end
                else
                    flag=0;
                end
            else
                flag=0;
            end
        else
            flag=0;
        end
        i_set=i_set/10;
        i_set=floor(i_set),
        x_set=x_set/1000;
        x_set=floor(x_set),
        y_set=y_set/1000;
        y_set=floor(y_set),
        i_count=i_count+1;
    end
    if num_i==count
        waitfor(msgbox('logged in'));
    else
        waitfor(msgbox('unable to log in'))
        close(gcf);
    end
    close(gcf);
else
    waitfor(msgbox('user not registered'));
end


function user_id_Callback(hObject, eventdata, handles)
% hObject    handle to user_id (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of user_id as text
%        str2double(get(hObject,'String')) returns contents of user_id as a double


% --- Executes during object creation, after setting all properties.
function user_id_CreateFcn(hObject, eventdata, handles)
% hObject    handle to user_id (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
ha = axes('units','normalized','position',[0 0 1 1]);
uistack(ha,'bottom');
I=imread('login_back.jpg');
hi = imagesc(I)
colormap gray
set(ha,'handlevisibility','off','visible','off')
set(hi,'alphadata',.9)


% --- Executes on button press in new_user.
function new_user_Callback(hObject, eventdata, handles)
% hObject    handle to new_user (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'u_id','USER ID');
setappdata(0,'f_name','FIRST NAME');
setappdata(0,'l_name','LAST NAME');
setappdata(0,'c_s',0);
aaa=getappdata(0,'c_s');
setappdata(0,'s_state','off');
setappdata(0,'f_state','off');
setappdata(0,'n_state','on');
setappdata(0,'img','');
setappdata(0,'x','');
setappdata(0,'y','');
close(new_log);
run(sign_up);