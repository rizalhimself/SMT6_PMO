<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;
use http\Client\Curl\User;

class Users extends ResourceController
{
    /**
     * Return an array of resource objects, themselves in array format
     *
     * @return mixed
     */
    protected $modelName = 'App\Models\UserModel';
    protected $format = 'json';

    public function __construct()
    {
        $this->validation=\Config\Services::validation();
    }

    public function index()
    {
        //
        return $this->respond($this->model->findAll());
    }

    /**
     * Return the properties of a resource object
     *
     * @return mixed
     */
    public function show($id = null)
    {
        //
        $data = $this->model->findById($id);

        if($data){
            return $this->respond($data);
        }

        return $this->fail('id tidak ditemukan');
    }

    /**
     * Return a new resource object, with default properties
     *
     * @return mixed
     */
    public function create()
    {
        //
        $data = $this->request->getPost();
        $validate = $this->validation->run($data, 'register');
        $errors=$this->validation->getErrors();

        if ($errors){
            return $this->fail($errors);
        }

        $user=new \App\Entities\Users();
        $user->fill($data);
        $user->created_by=0;
        $user->create_date=date("Y-m-d H:i:s");

        if ($this->model->save($user)){
            return $this->respondCreated($user,'user created');
        }
    }

    /**
     * Return the editable properties of a resource object
     *
     * @return mixed
     */

    public function update($id = null)
    {
        //
        $data = $this->request->getRawInput();
        $data['id']=$id;
        $validate=$this->validation->run($data,'update_user');
        $errors = $this->validation->getErrors();

        if ($errors){
            return $this->fail($errors);
        }

        if (!$this->model->findById($id)) {
            return $this->fail('id tidak ditemukan');
        }

        $user= new \App\Entities\Users();
        $user->fill($data);
        $user->updated_by=0;
        $user->updated_date=date("Y-m-d H:i:s");

        if ($this->model->save($user)){
            return $this->respondUpdated($user, 'user updated');
        }
    }

    /**
     * Delete the designated resource object from the model
     *
     * @return mixed
     */
    public function delete($id = null)
    {
        //
        if (!$this->model->findById($id)){
            return $this->fail('id tidak ditemukan');
        }

        if($this->model->delete($id)){
            return $this->respondDeleted(['id'=>$id.'Deleted']);
        }
    }
}
