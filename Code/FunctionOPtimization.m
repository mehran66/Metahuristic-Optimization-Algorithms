function varargout = FunctionOPtimization(varargin)
% FUNCTIONOPTIMIZATION M-file for FunctionOPtimization.fig
%      FUNCTIONOPTIMIZATION, by itself, creates a new FUNCTIONOPTIMIZATION or raises the existing
%      singleton*.
%
%      H = FUNCTIONOPTIMIZATION returns the handle to a new FUNCTIONOPTIMIZATION or the handle to
%      the existing singleton*.
%
%      FUNCTIONOPTIMIZATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FUNCTIONOPTIMIZATION.M with the given input arguments.
%
%      FUNCTIONOPTIMIZATION('Property','Value',...) creates a new FUNCTIONOPTIMIZATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FunctionOPtimization_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FunctionOPtimization_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FunctionOPtimization

% Last Modified by GUIDE v2.5 28-Jan-2011 17:21:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FunctionOPtimization_OpeningFcn, ...
                   'gui_OutputFcn',  @FunctionOPtimization_OutputFcn, ...
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


% --- Executes just before FunctionOPtimization is made visible.
function FunctionOPtimization_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FunctionOPtimization (see VARARGIN)

% Choose default command line output for FunctionOPtimization
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FunctionOPtimization wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FunctionOPtimization_OutputFcn(hObject, eventdata, handles) 

% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --------------------------------------------------------------------
function Algorithm_Callback(hObject, eventdata, handles)
% hObject    handle to Algorithm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Particle_Swarm_Optimization_Callback(hObject, eventdata, handles)
% hObject    handle to Particle_Swarm_Optimization (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Algorithm
set(handles.Title,'string','Particle Swarm Optimization')
set(handles.uipanel4,'visible','on')
set(handles.uipanel5,'visible','off')
set(handles.uipanel6,'visible','off')
set(handles.uipanel7,'visible','off')
set(handles.uipanel8,'visible','off')
set(handles.uipanel9,'visible','off')
Algorithm=1;
% --------------------------------------------------------------------
function Cat_Swarm_Optimization_Callback(hObject, eventdata, handles)
% hObject    handle to Cat_Swarm_Optimization (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Algorithm
set(handles.Title,'string','Cat Swarm Optimization')
set(handles.uipanel4,'visible','off')
set(handles.uipanel5,'visible','on')
set(handles.uipanel6,'visible','off')
set(handles.uipanel7,'visible','off')
set(handles.uipanel8,'visible','off')
set(handles.uipanel9,'visible','off')
Algorithm=2;
% --------------------------------------------------------------------
function Genetic_Algorithm_Callback(hObject, eventdata, handles)
% hObject    handle to Genetic_Algorithm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Algorithm
set(handles.Title,'string','Genetic Algorithm')
set(handles.uipanel4,'visible','off')
set(handles.uipanel5,'visible','off')
set(handles.uipanel6,'visible','on')
set(handles.uipanel7,'visible','off')
set(handles.uipanel8,'visible','off')
set(handles.uipanel9,'visible','off')
Algorithm=3;
% --------------------------------------------------------------------
function BeeColony_Callback(hObject, eventdata, handles)
% hObject    handle to BeeColony (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Algorithm
set(handles.Title,'string','Bee Colony')
set(handles.uipanel4,'visible','off')
set(handles.uipanel5,'visible','off')
set(handles.uipanel6,'visible','off')
set(handles.uipanel7,'visible','on')
set(handles.uipanel8,'visible','off')
set(handles.uipanel9,'visible','off')
Algorithm=4;
% --------------------------------------------------------------------
function TabuSearch_Callback(hObject, eventdata, handles)
% hObject    handle to TabuSearch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Algorithm
set(handles.Title,'string','Tabu Search')
set(handles.uipanel4,'visible','off')
set(handles.uipanel5,'visible','off')
set(handles.uipanel6,'visible','off')
set(handles.uipanel7,'visible','off')
set(handles.uipanel8,'visible','off')
set(handles.uipanel9,'visible','on')
Algorithm=5;
% --------------------------------------------------------------------
function AntColony_Callback(hObject, eventdata, handles)
% hObject    handle to AntColony (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Algorithm
set(handles.Title,'string','Ant Colony')
set(handles.uipanel4,'visible','off')
set(handles.uipanel5,'visible','off')
set(handles.uipanel6,'visible','off')
set(handles.uipanel7,'visible','off')
set(handles.uipanel8,'visible','off')
set(handles.uipanel9,'visible','off')
Algorithm=6;
% --------------------------------------------------------------------
function SimulatedAnnealing_Callback(hObject, eventdata, handles)
% hObject    handle to SimulatedAnnealing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Algorithm
set(handles.Title,'string','Simulated Annealing')
set(handles.uipanel4,'visible','off')
set(handles.uipanel5,'visible','off')
set(handles.uipanel6,'visible','off')
set(handles.uipanel7,'visible','off')
set(handles.uipanel8,'visible','on')
set(handles.uipanel9,'visible','off')
Algorithm=7;
% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_x_min_Callback(hObject, eventdata, handles)
% hObject    handle to txt_x_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_x_min as text
%        str2double(get(hObject,'String')) returns contents of txt_x_min as
%        a double


% --- Executes during object creation, after setting all properties.
function txt_x_min_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_x_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_x_max_Callback(hObject, eventdata, handles)
% hObject    handle to txt_x_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_x_max as text
%        str2double(get(hObject,'String')) returns contents of txt_x_max as a double


% --- Executes during object creation, after setting all properties.
function txt_x_max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_x_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_y_max_Callback(hObject, eventdata, handles)
% hObject    handle to txt_y_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_y_max as text
%        str2double(get(hObject,'String')) returns contents of txt_y_max as a double


% --- Executes during object creation, after setting all properties.
function txt_y_max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_y_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_y_min_Callback(hObject, eventdata, handles)
% hObject    handle to txt_y_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_y_min as text
%        str2double(get(hObject,'String')) returns contents of txt_y_min as a double


% --- Executes during object creation, after setting all properties.
function txt_y_min_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_y_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnShow.
function btnShow_Callback(hObject, eventdata, handles)
% hObject    handle to btnShow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global  X_VarHigh X_VarLow Y_VarHigh Y_VarLow funnum
X_VarHigh=str2double(get(handles.txt_x_max,'string'));
X_VarLow=str2double(get(handles.txt_x_min,'string'));
Y_VarHigh=str2double(get(handles.txt_y_max,'string'));
Y_VarLow=str2double(get(handles.txt_y_min,'string'));
funnum=get(handles.popupmenu1,'value');
[X,Y]=meshgrid(X_VarLow:.2:X_VarHigh,Y_VarLow:.2:Y_VarHigh);
Z=Function(X,Y,funnum);
% meshc(X,Y,Z)
surfl(handles.axes1,X,Y,Z);
shading interp
colormap copper
hold off



function txtSwarmSize_Callback(hObject, eventdata, handles)
% hObject    handle to txtSwarmSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtSwarmSize as text
%        str2double(get(hObject,'String')) returns contents of txtSwarmSize as a double


% --- Executes during object creation, after setting all properties.
function txtSwarmSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtSwarmSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtMaximumIteration_Callback(hObject, eventdata, handles)
% hObject    handle to txtMaximumIteration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtMaximumIteration as text
%        str2double(get(hObject,'String')) returns contents of txtMaximumIteration as a double


% --- Executes during object creation, after setting all properties.
function txtMaximumIteration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtMaximumIteration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtC2_Callback(hObject, eventdata, handles)
% hObject    handle to txtC2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtC2 as text
%        str2double(get(hObject,'String')) returns contents of txtC2 as a double


% --- Executes during object creation, after setting all properties.
function txtC2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtC2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtC1_Callback(hObject, eventdata, handles)
% hObject    handle to txtC1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtC1 as text
%        str2double(get(hObject,'String')) returns contents of txtC1 as a double


% --- Executes during object creation, after setting all properties.
function txtC1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtC1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnRun.
function btnRun_Callback(hObject, eventdata, handles)
% hObject    handle to btnRun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global  X_VarHigh X_VarLow Y_VarHigh Y_VarLow funnum Algorithm
switch Algorithm 
    case 0
        msgbox('please enter appropriate value.','vacant field','error');
    case 1
        SwarmSize =str2double(get(handles.txtSwarmSize,'string')); 
        MaxIter = str2double(get(handles.txtMaximumIteration,'string'));
        C1 =str2double(get(handles.txtC1,'string'));
        C2 =str2double(get(handles.txtC2,'string')); 
        hold (handles.axes1,'off');
        axes(handles.axes1);
        [BestCost,MeanCost,GlobalBestPosition]=PSO_Fnc(X_VarHigh,X_VarLow,Y_VarHigh,Y_VarLow,SwarmSize,MaxIter,C1,C2,funnum); 
        hold (handles.axes2,'off');
        plot (handles.axes2,BestCost,'--rs','LineWidth',5,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',1);
        hold (handles.axes2,'on');
        plot (handles.axes2,MeanCost,'--b','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',1);
        set(handles.text25,'String',['X : ',int2str(GlobalBestPosition(1)),'   Y : ',num2str(GlobalBestPosition(2)),'   Z : ',int2str(GlobalBestPosition(3))])
    case 2
        %% Algorithm parameters
        SMP= str2double(get(handles.txt_CSO_SMP,'string'));
        SRD= str2double(get(handles.txt_CSO_SRD,'string'));
        SPC=(get(handles.txt_CSO_SPC,'string'));
        cat_no= str2double(get(handles.txt_CSO_SwarmSize,'string'));
        MR=ceil( str2double(get(handles.txt_CSO_MR,'string'))*cat_no);
        c= str2double(get(handles.txt_CSO_c,'string'));
        max_iter= str2double(get(handles.txt_CSO_MaximumIteration,'string'));
        vmax= str2double(get(handles.txt_CSO_Vmax,'string'));
        vmin= str2double(get(handles.txt_CSO_Vmin,'string'));
        hold (handles.axes1,'off');
        axes(handles.axes1);
        [BestCost,MeanCost,GlobalBestPosition]=CSO_Fnc(X_VarHigh,X_VarLow,Y_VarHigh,Y_VarLow,cat_no,max_iter,funnum,SMP,SRD,SPC,MR,c,vmax,vmin);
        hold (handles.axes2,'off');
        plot (handles.axes2,BestCost,'--rs','LineWidth',5,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',1);
        hold (handles.axes2,'on');
        plot (handles.axes2,MeanCost,'--b','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',1);
        set(handles.text25,'String',['X : ',int2str(GlobalBestPosition(1)),'   Y : ',num2str(GlobalBestPosition(2)),'   Z : ',int2str(GlobalBestPosition(3))])
    case 3
        popsize =str2double(get(handles.txt_Pop_GA,'string')); 
        MaxIter = str2double(get(handles.txt_Iter_GA,'string'));
        KeepPercent =str2double(get(handles.txt_Keep_GA,'string'));
        CrossPercent =str2double(get(handles.txt_Cross_GA,'string')); 
        MutatPercent =str2double(get(handles.txt_Mutat_GA,'string')); 
        hold (handles.axes1,'off');
        axes(handles.axes1);
        [BestCost,MeanCost,GlobalBestPosition]=GA_Fnc(X_VarHigh,X_VarLow,Y_VarHigh,Y_VarLow,MaxIter,funnum,popsize,KeepPercent,CrossPercent,MutatPercent);
        hold (handles.axes2,'off');
        plot (handles.axes2,BestCost,'--rs','LineWidth',5,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',1);
        hold (handles.axes2,'on');
        plot (handles.axes2,MeanCost,'--b','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',1);
       set(handles.text25,'String',['X : ',int2str(GlobalBestPosition(1)),'   Y : ',num2str(GlobalBestPosition(2)),'   Z : ',int2str(GlobalBestPosition(3))])
    case 4
        n =str2double(get(handles.txt_population_bee,'string')); 
        MaxIteration = str2double(get(handles.txt_iteration_bee,'string'));
        m =str2double(get(handles.txt_bestBee,'string'));
        e =str2double(get(handles.txt_elitBee,'string')); 
        Ne =str2double(get(handles.txt_neighborElit,'string')); 
        Nb =str2double(get(handles.txt_NeighborOther,'string')); 
        Nr =str2double(get(handles.txt_sizeofneighborhood,'string'));
        hold (handles.axes1,'off');
        axes(handles.axes1);
        [BestCost,MeanCost,GlobalBestPosition]=Bee_Fnc(X_VarHigh,X_VarLow,Y_VarHigh,Y_VarLow,MaxIteration,n,m,e,Ne,Nb,Nr,funnum)
        hold (handles.axes2,'off');
        plot (handles.axes2,BestCost,'--rs','LineWidth',5,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',1);
        hold (handles.axes2,'on');
        plot (handles.axes2,MeanCost,'--b','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',1);
       set(handles.text25,'String',['X : ',int2str(GlobalBestPosition(1)),'   Y : ',num2str(GlobalBestPosition(2)),'   Z : ',int2str(GlobalBestPosition(3))])
    case 7
        InitialTemperature =str2double(get(handles.txt_intialtemp_Sa,'string')); 
        FinalTemperature = str2double(get(handles.txt_FinalTemp_SA,'string'));
        CoolingRate =str2double(get(handles.txt_cooling_SA,'string'));
        mM=1;
        hold (handles.axes1,'off');
        axes(handles.axes1);
        [MeanCost,BestCost,GlobalBestPosition]=SA(X_VarLow,X_VarHigh,Y_VarLow,Y_VarHigh,InitialTemperature,FinalTemperature,CoolingRate,funnum,mM)
        hold (handles.axes2,'off');
        plot (handles.axes2,BestCost,'--rs','LineWidth',5,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',1);
        hold (handles.axes2,'on');
        plot (handles.axes2,MeanCost,'--b','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',1);
        set(handles.text25,'String',['X : ',int2str(GlobalBestPosition(1)),'   Y : ',num2str(GlobalBestPosition(2)),'   Z : ',int2str(GlobalBestPosition(3))])
    case 5
        MaximumIteration =str2double(get(handles.txt_maximumIter_TS,'string')); 
        hold (handles.axes1,'off');
        axes(handles.axes1);
        [BestCost,GlobalBestPosition]=TS_Fnc(X_VarHigh,X_VarLow,Y_VarHigh,Y_VarLow,MaximumIteration,funnum);
        hold (handles.axes2,'off');
        plot (handles.axes2,BestCost,'--rs','LineWidth',5,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',1);
        set(handles.text25,'String',['X : ',int2str(GlobalBestPosition(1)),'   Y : ',num2str(GlobalBestPosition(2)),'   Z : ',int2str(GlobalBestPosition(3))])
        
end



function txt_CSO_SMP_Callback(hObject, eventdata, handles)
% hObject    handle to txt_CSO_SMP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_CSO_SMP as text
%        str2double(get(hObject,'String')) returns contents of txt_CSO_SMP as a double


% --- Executes during object creation, after setting all properties.
function txt_CSO_SMP_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_CSO_SMP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_CSO_SRD_Callback(hObject, eventdata, handles)
% hObject    handle to txt_CSO_SRD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_CSO_SRD as text
%        str2double(get(hObject,'String')) returns contents of txt_CSO_SRD as a double


% --- Executes during object creation, after setting all properties.
function txt_CSO_SRD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_CSO_SRD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_CSO_MaximumIteration_Callback(hObject, eventdata, handles)
% hObject    handle to txt_CSO_MaximumIteration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_CSO_MaximumIteration as text
%        str2double(get(hObject,'String')) returns contents of txt_CSO_MaximumIteration as a double


% --- Executes during object creation, after setting all properties.
function txt_CSO_MaximumIteration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_CSO_MaximumIteration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_CSO_SwarmSize_Callback(hObject, eventdata, handles)
% hObject    handle to txt_CSO_SwarmSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_CSO_SwarmSize as text
%        str2double(get(hObject,'String')) returns contents of txt_CSO_SwarmSize as a double


% --- Executes during object creation, after setting all properties.
function txt_CSO_SwarmSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_CSO_SwarmSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_CSO_SPC_Callback(hObject, eventdata, handles)
% hObject    handle to txt_CSO_SPC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_CSO_SPC as text
%        str2double(get(hObject,'String')) returns contents of txt_CSO_SPC as a double


% --- Executes during object creation, after setting all properties.
function txt_CSO_SPC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_CSO_SPC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_CSO_MR_Callback(hObject, eventdata, handles)
% hObject    handle to txt_CSO_MR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_CSO_MR as text
%        str2double(get(hObject,'String')) returns contents of txt_CSO_MR as a double


% --- Executes during object creation, after setting all properties.
function txt_CSO_MR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_CSO_MR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_CSO_c_Callback(hObject, eventdata, handles)
% hObject    handle to txt_CSO_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_CSO_c as text
%        str2double(get(hObject,'String')) returns contents of txt_CSO_c as a double


% --- Executes during object creation, after setting all properties.
function txt_CSO_c_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_CSO_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_CSO_Vmax_Callback(hObject, eventdata, handles)
% hObject    handle to txt_CSO_Vmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_CSO_Vmax as text
%        str2double(get(hObject,'String')) returns contents of txt_CSO_Vmax as a double


% --- Executes during object creation, after setting all properties.
function txt_CSO_Vmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_CSO_Vmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_CSO_Vmin_Callback(hObject, eventdata, handles)
% hObject    handle to txt_CSO_Vmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_CSO_Vmin as text
%        str2double(get(hObject,'String')) returns contents of txt_CSO_Vmin as a double


% --- Executes during object creation, after setting all properties.
function txt_CSO_Vmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_CSO_Vmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_Pop_GA_Callback(hObject, eventdata, handles)
% hObject    handle to txt_Pop_GA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_Pop_GA as text
%        str2double(get(hObject,'String')) returns contents of txt_Pop_GA as a double


% --- Executes during object creation, after setting all properties.
function txt_Pop_GA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_Pop_GA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_Iter_GA_Callback(hObject, eventdata, handles)
% hObject    handle to txt_Iter_GA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_Iter_GA as text
%        str2double(get(hObject,'String')) returns contents of txt_Iter_GA as a double


% --- Executes during object creation, after setting all properties.
function txt_Iter_GA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_Iter_GA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_Keep_GA_Callback(hObject, eventdata, handles)
% hObject    handle to txt_Keep_GA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_Keep_GA as text
%        str2double(get(hObject,'String')) returns contents of txt_Keep_GA as a double


% --- Executes during object creation, after setting all properties.
function txt_Keep_GA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_Keep_GA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_Cross_GA_Callback(hObject, eventdata, handles)
% hObject    handle to txt_Cross_GA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_Cross_GA as text
%        str2double(get(hObject,'String')) returns contents of txt_Cross_GA as a double


% --- Executes during object creation, after setting all properties.
function txt_Cross_GA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_Cross_GA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_Mutat_GA_Callback(hObject, eventdata, handles)
% hObject    handle to txt_Mutat_GA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_Mutat_GA as text
%        str2double(get(hObject,'String')) returns contents of txt_Mutat_GA as a double


% --- Executes during object creation, after setting all properties.
function txt_Mutat_GA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_Mutat_GA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_population_bee_Callback(hObject, eventdata, handles)
% hObject    handle to txt_population_bee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_population_bee as text
%        str2double(get(hObject,'String')) returns contents of txt_population_bee as a double


% --- Executes during object creation, after setting all properties.
function txt_population_bee_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_population_bee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_iteration_bee_Callback(hObject, eventdata, handles)
% hObject    handle to txt_iteration_bee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_iteration_bee as text
%        str2double(get(hObject,'String')) returns contents of txt_iteration_bee as a double


% --- Executes during object creation, after setting all properties.
function txt_iteration_bee_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_iteration_bee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_bestBee_Callback(hObject, eventdata, handles)
% hObject    handle to txt_bestBee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_bestBee as text
%        str2double(get(hObject,'String')) returns contents of txt_bestBee as a double


% --- Executes during object creation, after setting all properties.
function txt_bestBee_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_bestBee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_elitBee_Callback(hObject, eventdata, handles)
% hObject    handle to txt_elitBee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_elitBee as text
%        str2double(get(hObject,'String')) returns contents of txt_elitBee as a double


% --- Executes during object creation, after setting all properties.
function txt_elitBee_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_elitBee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_neighborElit_Callback(hObject, eventdata, handles)
% hObject    handle to txt_neighborElit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_neighborElit as text
%        str2double(get(hObject,'String')) returns contents of txt_neighborElit as a double


% --- Executes during object creation, after setting all properties.
function txt_neighborElit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_neighborElit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_NeighborOther_Callback(hObject, eventdata, handles)
% hObject    handle to txt_NeighborOther (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_NeighborOther as text
%        str2double(get(hObject,'String')) returns contents of txt_NeighborOther as a double


% --- Executes during object creation, after setting all properties.
function txt_NeighborOther_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_NeighborOther (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_sizeofneighborhood_Callback(hObject, eventdata, handles)
% hObject    handle to txt_sizeofneighborhood (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_sizeofneighborhood as text
%        str2double(get(hObject,'String')) returns contents of txt_sizeofneighborhood as a double


% --- Executes during object creation, after setting all properties.
function txt_sizeofneighborhood_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_sizeofneighborhood (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_intialtemp_Sa_Callback(hObject, eventdata, handles)
% hObject    handle to txt_intialtemp_Sa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_intialtemp_Sa as text
%        str2double(get(hObject,'String')) returns contents of txt_intialtemp_Sa as a double


% --- Executes during object creation, after setting all properties.
function txt_intialtemp_Sa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_intialtemp_Sa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_FinalTemp_SA_Callback(hObject, eventdata, handles)
% hObject    handle to txt_FinalTemp_SA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_FinalTemp_SA as text
%        str2double(get(hObject,'String')) returns contents of txt_FinalTemp_SA as a double


% --- Executes during object creation, after setting all properties.
function txt_FinalTemp_SA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_FinalTemp_SA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_cooling_SA_Callback(hObject, eventdata, handles)
% hObject    handle to txt_cooling_SA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_cooling_SA as text
%        str2double(get(hObject,'String')) returns contents of txt_cooling_SA as a double


% --- Executes during object creation, after setting all properties.
function txt_cooling_SA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_cooling_SA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_maximumIter_TS_Callback(hObject, eventdata, handles)
% hObject    handle to txt_maximumIter_TS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_maximumIter_TS as text
%        str2double(get(hObject,'String')) returns contents of txt_maximumIter_TS as a double


% --- Executes during object creation, after setting all properties.
function txt_maximumIter_TS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_maximumIter_TS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
