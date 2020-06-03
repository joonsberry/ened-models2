function varargout = project2(varargin)
% PROJECT2 MATLAB code for project2.fig
%      PROJECT2, by itself, creates a new PROJECT2 or raises the existing
%      singleton*.
%
%      H = PROJECT2 returns the handle to a new PROJECT2 or the handle to
%      the existing singleton*.
%
%      PROJECT2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT2.M with the given input arguments.
%
%      PROJECT2('Property','Value',...) creates a new PROJECT2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before project2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to project2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help project2

% Last Modified by GUIDE v2.5 21-Apr-2016 19:17:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @project2_OpeningFcn, ...
    'gui_OutputFcn',  @project2_OutputFcn, ...
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


% --- Executes just before project2 is made visible.
function project2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to project2 (see VARARGIN)

% Choose default command line output for project2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes project2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = project2_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function disp_axes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to disp_axes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate disp_axes



function p1x_Callback(hObject, eventdata, handles)
% hObject    handle to p1x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p1x as text
%        str2double(get(hObject,'String')) returns contents of p1x as a double
val = str2double(get(handles.p1x,'String'));
other = str2double(get(handles.p1y,'String'));
if isnan(val)
    set(handles.p1x,'String',' ');
    return
end
if get(handles.rect_button,'Value')
    set(handles.f1i,'String',val);
elseif isnan(other)
    return
else
    set(handles.f1i,'String',val*cosd(other));
    set(handles.f1j,'String',val*sind(other));
end
plot([0 str2double(get(handles.f1i,'String'))],[0 str2double(get(handles.f1j,'String'))],'b-',...
    [0 str2double(get(handles.f2i,'String'))],[0 str2double(get(handles.f2j,'String'))],'r-',...
    [0 str2double(get(handles.f3i,'String'))],[0 str2double(get(handles.f3j,'String'))],'g-');
set(handles.disp_axes, 'XLim', [-10,10], 'YLim', [-10,10]);


% --- Executes during object creation, after setting all properties.
function p1x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p1x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function p1y_Callback(hObject, eventdata, handles)
% hObject    handle to p1y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p1y as text
%        str2double(get(hObject,'String')) returns contents of p1y as a double
val = str2double(get(handles.p1y,'String'));
other = str2double(get(handles.p1x,'String'));
if isnan(val)
    set(handles.p1y,'String',' ');
    return
end
if get(handles.rect_button,'Value')
    set(handles.f1j,'String',val);
elseif isnan(other)
    return
else
    set(handles.f1i,'String',other*cosd(val));
    set(handles.f1j,'String',other*sind(val));
end
plot([0 str2double(get(handles.f1i,'String'))],[0 str2double(get(handles.f1j,'String'))],'b-',...
    [0 str2double(get(handles.f2i,'String'))],[0 str2double(get(handles.f2j,'String'))],'r-',...
    [0 str2double(get(handles.f3i,'String'))],[0 str2double(get(handles.f3j,'String'))],'g-');
set(handles.disp_axes, 'XLim', [-10,10], 'YLim', [-10,10]);

% --- Executes during object creation, after setting all properties.
function p1y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p1y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function p2x_Callback(hObject, eventdata, handles)
% hObject    handle to p2x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p2x as text
%        str2double(get(hObject,'String')) returns contents of p2x as a double
val = str2double(get(handles.p2x,'String'));
other = str2double(get(handles.p2y,'String'));
if isnan(val)
    set(handles.p2x,'String',' ');
    return
end
if get(handles.rect_button,'Value')
    set(handles.f2i,'String',val);
elseif isnan(other)
    return
else
    set(handles.f2i,'String',val*cosd(other));
    set(handles.f2j,'String',val*sind(other));
end
plot([0 str2double(get(handles.f1i,'String'))],[0 str2double(get(handles.f1j,'String'))],'b-',...
    [0 str2double(get(handles.f2i,'String'))],[0 str2double(get(handles.f2j,'String'))],'r-',...
    [0 str2double(get(handles.f3i,'String'))],[0 str2double(get(handles.f3j,'String'))],'g-');
set(handles.disp_axes, 'XLim', [-10,10], 'YLim', [-10,10]);

% --- Executes during object creation, after setting all properties.
function p2x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p2x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function p2y_Callback(hObject, eventdata, handles)
% hObject    handle to p2y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p2y as text
%        str2double(get(hObject,'String')) returns contents of p2y as a double
val = str2double(get(handles.p2y,'String'));
other = str2double(get(handles.p2x,'String'));
if isnan(val)
    set(handles.p2y,'String',' ');
    return
end
if get(handles.rect_button,'Value')
    set(handles.f2j,'String',val);
elseif isnan(other)
    return
else
    set(handles.f2i,'String',other*cosd(val));
    set(handles.f2j,'String',other*sind(val));
end
plot([0 str2double(get(handles.f1i,'String'))],[0 str2double(get(handles.f1j,'String'))],'b-',...
    [0 str2double(get(handles.f2i,'String'))],[0 str2double(get(handles.f2j,'String'))],'r-',...
    [0 str2double(get(handles.f3i,'String'))],[0 str2double(get(handles.f3j,'String'))],'g-');
set(handles.disp_axes, 'XLim', [-10,10], 'YLim', [-10,10]);


% --- Executes during object creation, after setting all properties.
function p2y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p2y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function p3x_Callback(hObject, eventdata, handles)
% hObject    handle to p3x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p3x as text
%        str2double(get(hObject,'String')) returns contents of p3x as a double
val = str2double(get(handles.p3x,'String'));
other = str2double(get(handles.p3y,'String'));
if isnan(val)
    set(handles.p3x,'String',' ');
    return
end
if get(handles.rect_button,'Value')
    set(handles.f3i,'String',val);
elseif isnan(other)
    return
else
    set(handles.f3i,'String',val*cosd(other));
    set(handles.f3j,'String',val*sind(other));
end
plot([0 str2double(get(handles.f1i,'String'))],[0 str2double(get(handles.f1j,'String'))],'b-',...
    [0 str2double(get(handles.f2i,'String'))],[0 str2double(get(handles.f2j,'String'))],'r-',...
    [0 str2double(get(handles.f3i,'String'))],[0 str2double(get(handles.f3j,'String'))],'g-');
set(handles.disp_axes, 'XLim', [-10,10], 'YLim', [-10,10]);

% --- Executes during object creation, after setting all properties.
function p3x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p3x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function p3y_Callback(hObject, eventdata, handles)
% hObject    handle to p3y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p3y as text
%        str2double(get(hObject,'String')) returns contents of p3y as a double
val = str2double(get(handles.p3y,'String'));
other = str2double(get(handles.p3x,'String'));
if isnan(val)
    set(handles.p3y,'String',' ');
    return
end
if get(handles.rect_button,'Value')
    set(handles.f3j,'String',val);
elseif isnan(other)
    return
else
    set(handles.f3i,'String',other*cosd(val));
    set(handles.f3j,'String',other*sind(val));
end
plot([0 str2double(get(handles.f1i,'String'))],[0 str2double(get(handles.f1j,'String'))],'b-',...
    [0 str2double(get(handles.f2i,'String'))],[0 str2double(get(handles.f2j,'String'))],'r-',...
    [0 str2double(get(handles.f3i,'String'))],[0 str2double(get(handles.f3j,'String'))],'g-');
set(handles.disp_axes, 'XLim', [-10,10], 'YLim', [-10,10]);



% --- Executes during object creation, after setting all properties.
function p3y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p3y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in clear_button.
function clear_button_Callback(hObject, eventdata, handles)
% hObject    handle to clear_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.p1x,'String',' ');
set(handles.p1y,'String',' ');
set(handles.p2x,'String',' ');
set(handles.p2y,'String',' ');
set(handles.p3x,'String',' ');
set(handles.p3y,'String',' ');
set(handles.f1i,'String',' ');
set(handles.f1j,'String',' ');
set(handles.f2i,'String',' ');
set(handles.f2j,'String',' ');
set(handles.f3i,'String',' ');
set(handles.f3j,'String',' ');
set(handles.ri,'String',' ');
set(handles.rj,'String',' ');
cla;


% --- Executes on button press in res_button.
function res_button_Callback(hObject, eventdata, handles)
% hObject    handle to res_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rx = 0;
ry = 0;
if ~isnan(str2double(get(handles.f1i,'String')))
    rx = rx + str2double(get(handles.f1i,'String'));
    ry = ry + str2double(get(handles.f1j,'String'));
end
if ~isnan(str2double(get(handles.f2i,'String')))
    rx = rx + str2double(get(handles.f2i,'String'));
    ry = ry + str2double(get(handles.f2j,'String'));
end
if ~isnan(str2double(get(handles.f3i,'String')))
    rx = rx + str2double(get(handles.f3i,'String'));
    ry = ry + str2double(get(handles.f3j,'String'));
end
set(handles.ri,'String',rx);
set(handles.rj,'String',ry);
plot([0 str2double(get(handles.f1i,'String'))],[0 str2double(get(handles.f1j,'String'))],'b-',...
    [0 str2double(get(handles.f2i,'String'))],[0 str2double(get(handles.f2j,'String'))],'r-',...
    [0 str2double(get(handles.f3i,'String'))],[0 str2double(get(handles.f3j,'String'))],'g-',...
    [0 rx],[0 ry],'k-');
set(handles.disp_axes, 'XLim', [-10,10], 'YLim', [-10,10]);
