namespace db.risk;

using {managed} from '@sap/cds/common';


entity risks {
    key id          : UUID;
        title       : String(100);
        prio        : String(5);
        descr       : String(100);
        impact      : Integer;
        criticality : Integer;
        miti_expand : Association to many mitigations
                          on $self.id = miti_expand.risks_id;


}

entity mitigations : managed {
    key id          : UUID;
        risks_id    : UUID;
        description : String(100);
        owner       : String(100);
        timeline    : String(100);

}
