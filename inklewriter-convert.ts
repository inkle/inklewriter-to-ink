
interface choice {
    linkPath: string,
    ifConditions: ifCondition[] | null,
    option: string,
    notIfConditions: notIfCondition[] | null
}

interface notIfCondition {
    notIfCondition: string
}

interface ifCondition {
    ifCondition: string
}


interface pageNum {
    pageNum: number
}

interface pageLabel {
    pageLabel: string
}

interface stitch {
    content: content[]
}

interface divert {
    divert: string
}

interface runOn {
    runOn: true
}

interface flag {
    flagName: string
}

type content = string | choice | divert | runOn | flag | pageNum | pageLabel;

interface inklewriterData {
    allowCheckpoints : boolean,
    optionMirroring : boolean,
    initial : string,
    stitches : {
        [name:string]: stitch
    }
}

interface inklewriterJSON {
    data : inklewriterData
}

export function convert(sourceJSON : inklewriterJSON) : string {
    
    let data = sourceJSON.data as inklewriterData;
    
    let aStitch = data.stitches["theSoundOfTheImp"];
    var content = aStitch.content[0];

    return content.toString();
}

