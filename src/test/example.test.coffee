vows = require('vows')
assert = require('assert')
nodeAcl = require('../lib/nodeAcl')
{Access,AccessGroup} = require('../lib/models')
EventPromise = require('events').EventEmitter
_ = require('underscore')

###
Manage Access Test
###

manageAccessTest = vows.describe('NodeACL Test: Access Module')

perfectAddMock =
  slug: 'viewVIPPromo'
  name: 'View Vip promo'
  desc: 'Only VIP can view this promo'
  enable: true

invalidAddMock =
  slug1: 'viewVIPPromo'
  name1: 'View Vip promo'
  desc1: 'Only VIP can view this promo'
  enable1: true

perfectReadMock =
  slug: 'viewVIPPromo'

perfectReadAllMock = {}

perfectUpdateMock =
  slug: 'viewVIPPromo'
  newSlug: 'updatedSlug'

invalidUpdateMock =
  slug: 'viewVIPPromo'


perfectDeleteMock =
  slug: 'updatedSlug'

invalidDeleteMock =
  slug1: 'updatedSlug'


###
testAccess = [
  {
    _id: '4e1c70d0ec27dba3de555601'
    slug: 'testAccess'
    name: 'Test Access Name'
    desc: 'Test Access Desc'
    enable: true
  },
]

testAccessGroup = [
  {
    _id: '4e1c70d0ec27dba3de555605'
    slug: 'testAccessGroup'
    name: 'Test Access Group'
    desc: 'Test Access Group Desc'
    access:
      _id: '4e1c70d0ec27dba3de555601'
      slug: 'testAccess'
      perm: 'allow'
  },
]


insertStubs = (callback) ->
  access = new Access()
  _.extend(access, testAccess[0])
  access.save (err) ->
    callback(null, true)
    unless err?
      accessGroup = new AccessGroup()
      _.extend(accessGroup, testAccessGroup[0])
      accessGroup.save (err) ->
        callback(null, true)
    else
      callback(err)
 
  
setUp =
  'Setting up mocks':
    topic: ->
      promise = new EventPromise()
      insertStubs (err, result) ->
        if err? then promise.emit('error', err)
        else promise.emit('success', result)
      promise
    'Done setting up stubs, initializing test:': (err, result) ->
      assert.isNull err
      assert.isTrue result

tearDown =
  'Tearing down mocks...':
    topic: {}
    'Tearing down access mock':
      topic: ->
        Access.remove({}, this.callback)
        return
      'Tear down access mock': (err,res) ->
        assert.isNull err
    'Tearing down access group mock':
      topic: ->
        AccessGroup.remove({}, this.callback)
        return
      'Tear down access group mock': (err, res) ->
        assert.isNull err
      'Deleted all test stubs': ->
          module.exports = {}
###

perfectCreateAccess = 
  'Add new access to ACL db: --':
    topic: perfectAddMock
    'Given new access was added into ACL db successfully':
      topic: (data) ->
        nodeAcl.createAccess(data, this.callback)
      'THEN it should return no error': (err, res) ->
        assert.isNull err

invalidCreateAccess = 
  'Add invalid access to ACL db: --':
    topic: invalidAddMock
    'Given access name is empty':
      topic: (data) ->
        nodeAcl.createAccess(data, this.callback)
      'THEN it should return an error code 1002': (err, res) ->
        assert.equal err, 1002

perfectReadOneAccess = 
  'Read one access from ACL db: --':
    topic: perfectReadMock
    'Given slug name is provided':
      topic: (data) ->
        nodeAcl.readAccess(data, this.callback)
      'THEN it should return no error': (err, res) ->
        assert.isNull err

perfectReadAllAccess = 
  'Read all access from ACL db: --':
    topic: perfectReadAllMock
    'Given input parameter is empty':
      topic: (data) ->
        
        nodeAcl.readAccess(data, this.callback)
      'THEN it should return no error': (err, res) ->
        assert.isNull err
        assert.isArray res

perfectUpdateAccess = 
  'Update ACL access: --':
    topic: perfectUpdateMock
    'Given input fields are valid':
      topic: (data) ->
        nodeAcl.updateAccess(data, this.callback)
      'THEN it should return no error': (err, res) ->
        assert.isNull err


invalidUpdateAccess = 
  'Update ACL access with invalid input: --':
    topic: invalidUpdateMock
    'Given empty update fields':
      topic: (data) ->
        nodeAcl.updateAccess(data, this.callback)
      'THEN it should return an error code 1006': (err, res) ->
        assert.equal err, 1006


perfectDeleteAccess = 
  'Delete ACL access: --':
    topic: perfectDeleteMock
    'Given input fields are valid':
      topic: (data) ->
        
        nodeAcl.deleteAccess(data, this.callback)
      'THEN it should return no error': (err, res) ->
        assert.isNull err


invalidDeleteAccess = 
  'Delete ACL access with invalid input: --':
    topic: invalidDeleteMock
    'Given invalid access slug':
      topic: (data) ->
        nodeAcl.deleteAccess(data, this.callback)
      'THEN it should return an error code 1002': (err, res) ->
        assert.equal err, 1002
###
End of Manage Access Test
###


###
Manage Access Group Test
###

manageAccessGroupTest = vows.describe "NodeACL Test: AccessGroup"


perfectAddGroupMock =
  slug: 'VIPAccessGroup'
  name: 'VIP Access Group'
  desc: 'Put VIP accesses under this group'
  access: [
    {
      _id: '4e1c70d0ec27dba3de555610'
      slug: 'viewVIPPromo'
      perm: 'allow'
    },
    {
      _id: '4e1c70d0ec27dba3de555611'
      slug: 'depositBonus'
      perm: 'deny'
    }
  ]

invalidSlugAddGroupMock =
  name: 'VIP Access Group'
  desc: 'Put VIP accesses under this group'
  access: [
    {
      _id: '4e1c70d0ec27dba3de555612'
      slug: 'viewVIPPromo'
      perm: 'allow'
    },
    {
      _id: '4e1c70d0ec27dba3de555613'
      slug: 'depositBonus'
      perm: 'deny'
    }
  ]

perfectReadGroupMock =
  slug: 'VIPAccessGroup'

perfectReadAllGroupMock = {}

perfectSlugUpdateGroupMock =
  slug: 'VIPAccessGroup'
  newSlug: 'superVIPAccessGroup'

perfectAccessUpdateGroupMock =
  slug: 'superVIPAccessGroup'
  newAccess: [
    {
      _id: '4e1c70d0ec27dba3de555612'
      slug: 'viewVIPTournament'
      perm: 'allow'
    },
    {
      _id: '4e1c70d0ec27dba3de555613'
      slug: 'depositBonus'
      perm: 'allow'
    }
  ] 

invalidUpdateGroupMock =
  slug: 'superVIPAccessGroup'


perfectDeleteGroupMock =
  slug: 'superVIPAccessGroup'

invalidDeleteGroupMock =
  slug1: 'superVIPAccessGroup'


perfectCreateGroupAccess = 
  'Add new access group to ACL db: --':
    topic: perfectAddGroupMock
    'Given new access group was added into ACL db successfully':
      topic: (data) ->
        
        nodeAcl.createAccessGroup(data, this.callback)
      'THEN it should return no error': (err, res) ->
        assert.isNull err

invalidSlugCreateAccessGroup = 
  'Add invalid access group to ACL db: --':
    topic: invalidSlugAddGroupMock
    'Given access group slug is empty':
      topic: (data) ->
        
        nodeAcl.createAccessGroup(data, this.callback)
      'THEN it should return an error code 1009': (err, res) ->
        assert.equal err, 1009

perfectReadOneAccessGroup = 
  'Read one access group from ACL db: --':
    topic: perfectReadGroupMock
    'Given slug name is provided':
      topic: (data) ->
        
        nodeAcl.readAccessGroup(data, this.callback)
      'THEN it should return no error': (err, res) ->
        assert.isNull err

perfectReadAllAccessGroup = 
  'Read all access group from ACL db: --':
    topic: perfectReadAllGroupMock
    'Given slug name is empty':
      topic: (data) ->
        
        nodeAcl.readAccessGroup(data, this.callback)
      'THEN it should return no error': (err, res) ->
        assert.isNull err
        assert.isArray res

perfectSlugUpdateAccessGroup = 
  'Update ACL access group: --':
    topic: perfectSlugUpdateGroupMock
    'Given old and new slug are valid':
      topic: (data) ->
        
        nodeAcl.updateAccessGroup(data, this.callback)
      'THEN it should return no error': (err, res) ->
        assert.isNull err

perfectAccessUpdateAccessGroup = 
  'Update ACL access group: --':
    topic: perfectAccessUpdateGroupMock
    'Given old slug and new access are valid':
      topic: (data) ->
        nodeAcl.updateAccessGroup(data, this.callback)
      'THEN it should return no error': (err, res) ->
        assert.isNull err

invalidUpdateAccessGroup = 
  'Update ACL access group with invalid input: --':
    topic: invalidUpdateGroupMock
    'Given empty update fields':
      topic: (data) ->
        nodeAcl.updateAccessGroup(data, this.callback)
      'THEN it should return an error code 1006': (err, res) ->
        assert.equal err, 1009

perfectDeleteAccessGroup = 
  'Delete ACL access group: --':
    topic: perfectDeleteGroupMock
    'Given access group exists in ACL db':
      topic: (data) ->
        nodeAcl.deleteAccessGroup(data, this.callback)
      'THEN it should return no error': (err, res) ->
        assert.isNull err

invalidDeleteAccessGroup = 
  'Delete ACL access group with invalid input: --':
    topic: invalidDeleteGroupMock
    'Given access group doesnt exist':
      topic: (data) -> 
        nodeAcl.deleteAccessGroup(data, this.callback)
      'THEN it should return an error code 1009': (err, res) ->
        assert.equal err, 1009

###
End of Manage Access Group Test
###



manageAccessTest
  #.addBatch(setUp)
  .addBatch(perfectCreateAccess)
  .addBatch(invalidCreateAccess)
  .addBatch(perfectReadOneAccess)
  .addBatch(perfectReadAllAccess)
  .addBatch(perfectUpdateAccess)
  .addBatch(invalidUpdateAccess)
  .addBatch(perfectDeleteAccess)
  .addBatch(invalidDeleteAccess)
  .export(module)

manageAccessGroupTest
  .addBatch(perfectCreateGroupAccess)
  .addBatch(invalidSlugCreateAccessGroup)
  .addBatch(perfectReadOneAccessGroup)
  .addBatch(perfectReadAllAccessGroup)
  .addBatch(perfectSlugUpdateAccessGroup)
  .addBatch(perfectAccessUpdateAccessGroup)
  .addBatch(invalidUpdateAccessGroup)
  .addBatch(perfectDeleteAccessGroup)
  .addBatch(invalidDeleteAccessGroup)
  #.addBatch(tearDown)
  .export(module)

###
perfectAssignAccessNoConflict = 
  'Assign access to player without conflict: --':
    topic: perfectAssignMock
    'Given access was assigned to player profile without any conflics':
      topic: (data) ->

      'THEN it should return no error': (err, res) ->
        assert.isNull err
    

invalidPlayer =
  'Assign access to invalid player account: --':
    topic: invalidPlayerMock
    'Given invalid player account':
      topic: (data) ->

      'THEN it should return an error code 1001': (err, res) ->
        assert.equal err, 1001

assignAccessWithConflict = 
  "Conflict found when assign access to player account: --":
    topic: assignConflictMock
    'Given conflict found when assigning acccess to player profile':
      topic: (data) ->
      'THEN it should return an error code 1002': (err, res) ->
        assert.equal err, 1002
###
