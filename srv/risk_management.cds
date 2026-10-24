using { db.risk as link } from '../db/risk_management';

service MyService {
    @odata.draft.enabled

entity risk_set as projection on link.risks;
entity miti_set as projection on link.mitigations;
    
}

annotate MyService.risk_set with @(
    UI.SelectionFields: [
        title,
        prio,
        criticality
    ],

    UI.LineItem: [
        { Value: title, Label: 'Risk Title' },
        { Value: prio, Label: 'Priority' },
        { Value: descr, Label: 'Description' },
        { Value: impact, Label: 'Impact' },
        { Value: criticality, Label: 'Criticality' }
    ],

    UI.HeaderInfo: {
        TypeName: 'Risk',
        TypeNamePlural: 'Risks',
        Title: { Value: title },
        Description: { Value: descr }
    },

    UI.Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            Label: 'General Information',
            Target: '@UI.FieldGroup#General'
        },
        {
            $Type: 'UI.ReferenceFacet',
            Label: 'Mitigations',
            Target: 'miti_expand/@UI.LineItem'
        }
    ],

    UI.FieldGroup #General: {
        Data: [
            { Value: title, Label: 'Risk Title' },
            { Value: prio, Label: 'Priority' },
            { Value: descr, Label: 'Description' },
            { Value: impact, Label: 'Impact' },
            { Value: criticality, Label: 'Criticality' }
        ]
    }
);

annotate MyService.miti_set with @(
    UI.SelectionFields: [
        description,
        owner
    ],

    UI.LineItem: [
        { Value: description, Label: 'Mitigation' },
        { Value: owner, Label: 'Owner' },
        { Value: timeline, Label: 'Timeline' }
    ],

    UI.HeaderInfo: {
        TypeName: 'Mitigation',
        TypeNamePlural: 'Mitigations',
        Title: { Value: description },
        Description: { Value: owner }
    },

    UI.Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            Label: 'General Information',
            Target: '@UI.FieldGroup#General'
        }
    ],

    UI.FieldGroup #General: {
        Data: [
            { Value: description, Label: 'Description' },
            { Value: owner, Label: 'Owner' },
            { Value: timeline, Label: 'Timeline' }
        ]
    }
);







