function varargout = sign_up(varargin)
% SIGN_UP MATLAB code for sign_up.fig
%      SIGN_UP, by itself, creates a new SIGN_UP or raises the existing
%      singleton*.
%
%      H = SIGN_UP returns the handle to a new SIGN_UP or the handle to
%      the existing singleton*.
%
%      SIGN_UP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIGN_UP.M with the given input arguments.
%
%      SIGN_UP('Property','Value',...) creates a new SIGN_UP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sign_up_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sign_up_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sign_up

% Last Modified by GUIDE v2.5 07-Apr-2016 00:50:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sign_up_OpeningFcn, ...
                   'gui_OutputFcn',  @sign_up_OutputFcn, ...
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


% --- Executes just before sign_up is made visible.
function sign_up_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sign_up (see VARARGIN)

% Choose default command line output for sign_up
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sign_up wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sign_up_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
asd=getappdata(0,'n_state');
set(handles.next,'Enable',asd)
asd=getappdata(0,'s_state');
set(handles.submit,'Enable',asd)
op=getappdata(0,'u_id');
set(handles.user_name,'String',op);
op=getappdata(0,'f_name');
set(handles.first_name,'String',op);
op=getappdata(0,'l_name');
set(handles.last_name,'String',op);


function first_name_Callback(hObject, eventdata, handles)
% hObject    handle to first_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of first_name as text
%        str2double(get(hObject,'String')) returns contents of first_name as a double


% --- Executes during object creation, after setting all properties.
function first_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to first_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
ha = axes('units','normalized','position',[0 0 1 1]);
uistack(ha,'bottom');
I=imread('signup.png');
hi = imagesc(I)
colormap gray
set(ha,'handlevisibility','off','visible','off')
set(hi,'alphadata',.9)



function user_name_Callback(hObject, eventdata, handles)
% hObject    handle to user_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of user_name as text
%        str2double(get(hObject,'String')) returns contents of user_name as a double


% --- Executes during object creation, after setting all properties.
function user_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to user_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function last_name_Callback(hObject, eventdata, handles)
% hObject    handle to last_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of last_name as text
%        str2double(get(hObject,'String')) returns contents of last_name as a double


% --- Executes during object creation, after setting all properties.
function last_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to last_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str='';
set(handles.user_name,'String',str);
set(handles.first_name,'String',str);
set(handles.last_name,'String',str);

% --- Executes on button press in submit.
function submit_Callback(hObject, eventdata, handles)
% hObject    handle to submit (see GCBO)


% eventdata  reserved - to be defined in a future version of MATn,8LAB52
% handles    structure with handles and user data (see GUIDATA)
uid=get(handles.user_name,'String'),
fn=get(handles.first_name,'String'),
u_id=uid,
ii=getappdata(0,'img'),
ii=str2num(ii),
xx=getappdata(0,'x'),
xx=str2num(xx),
yy=getappdata(0,'y'),
yy=str2num(yy),
dbname = 'DBMS';
username = 'root';
password = '123';
driver = 'com.mysql.jdbc.Driver';
dburl = ['jdbc:mysql://localhost:3306/' dbname];
conn = database(dbname,username,password,driver,dburl);    
d='''';
uid=strcat(d,uid),
uid=strcat(uid,d),
sqlquery = 'select * from USERS where user_id=';
uid=strcat(sqlquery,uid);
curs = exec(conn,uid);
curs = fetch(curs);
x1=curs.Data;
z=cell2mat(x1(1));
if strcmp(z,u_id);
    display('User_id already exist');
else 
    colnames = {'user_id','user_name'};
    data = {u_id,fn};
    data_table = cell2table(data,'VariableNames',colnames);
    tablename='users';
    fastinsert(conn,tablename,colnames,data_table);
    sqlquery = 'select count(*) from passwords';
    curs = exec(conn,sqlquery);
    curs = fetch(curs),
    x1=curs.Data,
    index=cell2mat(x1);
    index=index+1,
    colnames = {'password_id','user_id','image_set','xactual','yactual'};
    data = {index,u_id,ii,xx,yy};
    data1_table = cell2table(data,'VariableNames',colnames);
    tablename='passwords';
    fastinsert(conn,tablename,colnames,data1_table);
    display('thx');
end
close(curs);
close(conn);
%col3=get(handles.last_name,'String'),
% --- Executes on button press in next.
function next_Callback(hObject, eventdata, handles)
% hObject    handle to next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uid=get(handles.user_name,'String'),
fn=get(handles.first_name,'String'),
ln=get(handles.last_name,'String'),
setappdata(0,'u_id',uid);
setappdata(0,'f_name',fn);
setappdata(0,'l_name',ln);
close(sign_up);
run(axis);
%bn=getappdata(0,'asd');