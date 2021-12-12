import React from 'react';
import { getData } from '../apiService';
import {
    DataGrid,
    GridToolbarContainer,
    GridToolbarExport,
    gridClasses,
} from '@mui/x-data-grid';

function CustomToolbar() {
    return (
        <GridToolbarContainer className={gridClasses.toolbarContainer}>
            <GridToolbarExport />
        </GridToolbarContainer>
    );
}

export function Report({ token }) {
    console.log(token);
    const [data, setData] = React.useState([]);
    var columns = [
        {
            field: 'invoiceId', headerName: 'Numer faktury', width: 100, sortable: true, filter: true, editable: false, cellClass: 'text-center', headerClass: 'text-center', sort: 'asc', filterParams: { clearButton: true }

        },
        {
            field: 'contractorType', headerName: 'Typ kontrahenta', width: 100, sortable: true, filter: true, editable: false, cellClass: 'text-center', headerClass: 'text-center', sort: 'asc', filterParams: { clearButton: true }
        },
        {
            field: 'contractorNip', headerName: 'NIP kontrahenta', width: 100, sortable: true, filter: true, editable: false, cellClass: 'text-center', headerClass: 'text-center', sort: 'asc', filterParams: { clearButton: true }
        },
        {
            field: 'idCardNumber', headerName: 'Numer dowodu', width: 100, sortable: true, filter: true, editable: false, cellClass: 'text-center', headerClass: 'text-center', sort: 'asc', filterParams: { clearButton: true }
        },
        {
            field: 'transactionDate', headerName: 'Data wystawienia', width: 100, sortable: true, filter: true, editable: false, cellClass: 'text-center', headerClass: 'text-center', sort: 'asc', filterParams: { clearButton: true }
        },
        {
            field: 'registrationDate', headerName: 'Data rejestracji', width: 100, sortable: true, filter: true, editable: false, cellClass: 'text-center', headerClass: 'text-center', sort: 'asc', filterParams: { clearButton: true }
        },
        // {
        //     field: 'notes', headerName: 'Uwagi', width: 100, sortable: true, filter: true, hiden: true, editable: false, cellClass: 'text-center', headerClass: 'text-center', sort: 'asc', filterParams: { clearButton: true }
        // },
        {
            field: 'pit17', headerName: 'PIT 17', width: 100, sortable: true, filter: true, editable: false, cellClass: 'text-center', headerClass: 'text-center', sort: 'asc', filterParams: { clearButton: true }
        },
        {
            field: 'pit15', headerName: 'PIT 15', width: 100, sortable: true, filter: true, editable: false, cellClass: 'text-center', headerClass: 'text-center', sort: 'asc', filterParams: { clearButton: true }
        },
        {
            field: 'pit12', headerName: 'PIT 12', width: 100, sortable: true, filter: true, editable: false, cellClass: 'text-center', headerClass: 'text-center', sort: 'asc', filterParams: { clearButton: true }
        },
        {
            field: 'pit10', headerName: 'PIT 10', width: 100, sortable: true, filter: true, editable: false, cellClass: 'text-center', headerClass: 'text-center', sort: 'asc', filterParams: { clearButton: true }
        },
        {
            field: 'pit85', headerName: 'PIT 85', width: 100, sortable: true, filter: true, editable: false, cellClass: 'text-center', headerClass: 'text-center', sort: 'asc', filterParams: { clearButton: true }
        },
        {
            field: 'pit55', headerName: 'PIT 55', width: 100, sortable: true, filter: true, editable: false, cellClass: 'text-center', headerClass: 'text-center', sort: 'asc', filterParams: { clearButton: true }
        },
        {
            field: 'pit03', headerName: 'PIT 03', width: 100, sortable: true, filter: true, editable: false, cellClass: 'text-center', headerClass: 'text-center', sort: 'asc', filterParams: { clearButton: true }
        },
    ];


    React.useEffect(() => {
        getData(token).then((response) => response.json())
            .then((data) => setTable(data.table));
    }, []);
    function setTable(data) {
        data.forEach((row) => {
            row.id = row.invoiceId;
        });
        // each rpw pit convert from grosze to pln
        data.forEach((row) => {
            row.pit17 = row.pit17 / 100;
            row.pit15 = row.pit15 / 100;
            row.pit12 = row.pit12 / 100;
            row.pit10 = row.pit10 / 100;
            row.pit85 = row.pit85 / 100;
            row.pit55 = row.pit55 / 100;
            row.pit03 = row.pit03 / 100;
        });

        setData(data);
    }
    // const dane = [
    //     {
    //         "id": 0,
    //         "contractorType": "PL",
    //         "contractorNip": " 6371918445",
    //         "idCardNumber": " 765/12/2021",
    //         "transactionDate": "2020-12-30",
    //         "registrationDate": "2020-12-30",
    //         "notes": null,
    //         "pit17": 1042921,
    //         "pit15": 0,
    //         "pit12": 0,
    //         "pit10": 0,
    //         "pit85": 0,
    //         "pit55": 0,
    //         "pit03": 0
    //     },
    //     {
    //         "id": 1,
    //         "contractorType": "PL",
    //         "contractorNip": " 6761787436",
    //         "idCardNumber": " 445/1/2021",
    //         "transactionDate": "2021-01-01",
    //         "registrationDate": "2021-01-01",
    //         "notes": null,
    //         "pit17": 171276,
    //         "pit15": 0,
    //         "pit12": 0,
    //         "pit10": 0,
    //         "pit85": 0,
    //         "pit55": 0,
    //         "pit03": 0
    //     },
    //     {
    //         "id": 2,
    //         "contractorType": "PL",
    //         "contractorNip": " 5372162227",
    //         "idCardNumber": " 27/1/2021",
    //         "transactionDate": "2020-12-31",
    //         "registrationDate": "2021-01-01",
    //         "notes": null,
    //         "pit17": 551347,
    //         "pit15": 0,
    //         "pit12": 0,
    //         "pit10": 0,
    //         "pit85": 0,
    //         "pit55": 0,
    //         "pit03": 0
    //     },
    //     {
    //         "id": 3,
    //         "contractorType": "PL",
    //         "contractorNip": " 7641023725",
    //         "idCardNumber": " 180/1/2021",
    //         "transactionDate": "2021-01-01",
    //         "registrationDate": "2021-01-01",
    //         "notes": null,
    //         "pit17": 0,
    //         "pit15": 3369083,
    //         "pit12": 0,
    //         "pit10": 0,
    //         "pit85": 0,
    //         "pit55": 0,
    //         "pit03": 0
    //     },
    // ];
    return (
        <div className='report'>

            <div className='data-grid'>
                {data.length > 0 &&
                    <DataGrid

                        rows={data}
                        columns={columns}
                        exportFileName={'Raport'}
                        exportCsv={true}
                        exportExcel={true}
                        components={{
                            Toolbar: CustomToolbar,
                        }}

                    />
                }

            </div>
        </div>
    );
}